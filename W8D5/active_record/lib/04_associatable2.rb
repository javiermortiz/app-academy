require_relative '03_associatable'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  
  def has_one_through(name, through_name, source_name)
    
    # options = self.assoc_options[name]
#has_one :house,
    # class_name: :Houses,
    # through: :
    # source:
    define_method(name) do
      through_options = self.class.assoc_options[through_name]

      source_options =
        through_options.model_class.assoc_options[source_name]

      key_value = self.send(through_options.foreign_key)

      
      query = DBConnection.execute(<<-SQL, key_value)
        SELECT
          #{source_options.table_name}.*
        FROM 
          #{through_options.table_name}
        JOIN
          #{source_options.table_name}
        ON
          #{through_options.table_name}.#{source_options.foreign_key} = #{source_options.table_name}.#{through_options.primary_key}
        WHERE
          #{through_options.table_name}.id =  ?
      SQL

      self.parse_all(query)
      # result = options
      #   .model_class
      #   .where({options.foreign_key => pk_value})
    end
    
  end

end

# SELECT
#   houses.*
# FROM
#   humans
# JOIN
#   houses ON humans.house_id = houses.id
# WHERE
#   humans.id = ?

# class Cat < SQLObject
#   belongs_to :human, :foreign_key => :owner_id
#   has_one_through :home, :human, :house

#   finalize!
# end

# class Human < SQLObject
#   self.table_name = "humans"

#   belongs_to :house

#   finalize!
# end

# class House < SQLObject
#   finalize!
# end

# cat.home