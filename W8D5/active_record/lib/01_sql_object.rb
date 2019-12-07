require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns 
    query = DBConnection.execute2(<<-SQL)
              SELECT
                *
              FROM
                #{self.table_name}
            SQL

    columns = query.first
    @columns = columns.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |column|
      define_method(column) do
        self.attributes[column] 
      end

      define_method("#{column}=") do |param|
        self.attributes[column] = param 
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name 
  end

  def self.table_name
    @table_name || self.name.downcase.pluralize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
                SELECT
                  *
                FROM
                  #{self.table_name}
              SQL

    self.parse_all(results)
  end

  def self.parse_all(results)
    results.map do |result|
      self.new(result)
    end
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL)
              SELECT
                *
              FROM
                #{self.table_name}
              WHERE
                id = #{id}
            SQL
    (result.empty?)? (return nil) : (self.new(*result))
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym 
      if self.class.columns.include?(attr_name)
        #self.send :method_name, value https://apidock.com/ruby/Object/send
        self.send "#{attr_name}=", value 
      else  
        raise "unknown attribute '#{attr_name}'"
      end
    end 
  end

  def attributes
    @attributes || @attributes = {}
  end

  def attribute_values  
    self.class.columns.map do |col|
      self.send "#{col}" 
    end
    #puts a
  end

  def insert
    col_names = self.class.columns.drop(1).join(", ")
    question_marks = [] 
    (self.class.columns.length - 1).times { question_marks << "?" }
    question_marks = question_marks.join(", ")

    DBConnection.execute(<<-SQL, *self.attribute_values.drop(1))
                          INSERT INTO
                            #{self.class.table_name} (#{col_names})
                          VALUES
                            (#{question_marks})
                        SQL
    
    self.id = DBConnection.last_insert_row_id
  end

  def update   #[Gizmo, 123, 1]
    set_arr = []
    col_names = self.class.columns.drop(1)
    col_names.each do |name|
      set_arr << name.to_s + " = ?"
    end
    set_str = set_arr.join(", ")

    # columns  #{attr_name} = ?   join(",")
    DBConnection.execute(<<-SQL, *self.attribute_values.rotate)
                          UPDATE
                            #{self.class.table_name}
                          SET
                            #{set_str}
                          WHERE
                            id = ? 
                        SQL
  end

  def save
    (self.id.nil?) ? (self.insert) : (self.update) 
  end
end
