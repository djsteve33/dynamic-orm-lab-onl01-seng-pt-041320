require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  
  def self.table_name
    self.to_s.downcase.pluralize
  end
  
  def self.column_names
    sql = "pragma table_info('#{table_name}')"
    results = DB[:conn].execute(sql)
    results.map do |column|
      column['name']
    end.compact
  end
  
  def initialize(attributes = {})
    attributes.each do |property, value|
    self.send("#{property}=", value)
    end
  end
  
  def self.set_attr
  
end