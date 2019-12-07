require_relative '02_searchable'
require 'active_support/inflector'
require 'byebug'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class  # 'Human'  => Human
    self.class_name.constantize #https://apidock.com/rails/String/constantize
  end

  def table_name
    self.model_class.table_name
    #(self.class_name + "s").downcase  #human => humen
  end
end

# belongs_to :owner,
#   class_name: :User,
#   primary_key: :id,
#   foreign_key: :owner_id

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    @name = name
    name_str = name.to_s
    if options[:foreign_key]
      @foreign_key = options[:foreign_key]
    else 
      @foreign_key = (name_str + "_id").to_sym
      #self.send "foreign_key=", (name_str + "_id").to_sym
    end 
    if options[:class_name]
      @class_name = options[:class_name]
    else 
      @class_name = name_str.capitalize
    end 
    if options[:primary_key]
      @primary_key = options[:primary_key]
    else 
      @primary_key = :id 
    end 
  end
end

#self.send "#{attr_name}=", value 
# has_many :cats, 
#   class_name: :Cat,
#   primary_key: :id,
#   foreign_key: :human_id
class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    @name = name
    name_str = name.to_s
    self_name = self_class_name.to_s.downcase
    if options[:foreign_key]
      @foreign_key = options[:foreign_key]
    else 
      @foreign_key = (self_name + "_id").to_sym
      #self.send "foreign_key=", (name_str + "_id").to_sym
    end 
    if options[:class_name]
      @class_name = options[:class_name]
    else 
      @class_name = name_str.capitalize.singularize
    end 
    if options[:primary_key]
      @primary_key = options[:primary_key]
    else 
      @primary_key = :id 
    end 
  end
end

module Associatable
  # Phase IIIb
# id  | name   | owner_id =>   id  | name   |
#  1  | "Milo" | 1              1  |  David |

#self.send(self.foreign_key) is the value in the where method?
# where primary_key = self.send(self.foreign_key)
# model_class.where({primary_key: self.send(self.foreign_key)})

# belongs_to :owner,
#   class_name: :User,
#   primary_key: :id,
#   foreign_key: :owner_id 
  def belongs_to(name, options = {}) #stray_cat.human
    options = BelongsToOptions.new(name, options)
    
    self.assoc_options[name] = options

    define_method(name) do
      
      fk_value = self.send(options.foreign_key)

      result = options
        .model_class
        .where({options.primary_key => fk_value})
        .first
      
    end 
  end

  def has_many(name, options = {}) 
    options = HasManyOptions.new(name, self.name, options)

    define_method(name) do
      
      pk_value = self.send(options.primary_key)

      result = options
        .model_class
        .where({options.foreign_key => pk_value})
      
    end 
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
    @assoc_options || @assoc_options = {}
  end
end

class SQLObject
  extend Associatable
end
