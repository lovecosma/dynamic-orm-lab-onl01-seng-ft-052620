require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'interactive_record.rb'

class Student < InteractiveRecord

  def self.table_name
    self.to_s.downcase.pluralize
  end


  self.column_names.each do |col_name|
      attr_accessor col_name.to_sym
    end

  def initialize(hash = {})
    hash.each do |key, value|
     self.send("#{key}=", value)
    end
  end

  def table_name_for_insert
    self.class.table_name
  end

  def col_names_for_insert
    self.column_names
  end


end
