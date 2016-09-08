# Farmers Market Module


require 'csv'



module FarMar


  # def self.all
  #   data_list = []
  #
  #   CSV.open('./support/markets.csv', 'r').each do |row|
  #     id = row[0].to_i
  #     name = row[1]
  #     address = row[2]
  #     city = row[3]
  #     county = row[4]
  #     state = row[5]
  #     zip = row[6].to_i
  #
  #     data_list << self.new(id, name, address, city, county, state, zip)
  #   end
  #   return data_list
  # end
  #
  # def self.find(id)
  #   raise ArgumentError if id.class != Fixnum
  #   data_list = FarMar::Market.all
  #
  #   data_list.each do |object|
  #     if object.id == id
  #       return object
  #     end
  #   end
  #   return "Not a valid id"
  # end

end


require_relative 'lib/farmar_market'
require_relative 'lib/farmar_product'
require_relative 'lib/farmar_vendors'
require_relative 'lib/farmar_sale'
