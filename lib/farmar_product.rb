require_relative '../far_mar.rb'



class FarMar::Products
  # extend FarMar
  attr_reader :id

  def initialize(id, product_name, vendor_id)
    @id = id
    @product_name = product_name
    @vendor_id = vendor_id
  end

  def self.all
    product_list = []

    CSV.open('./support/products.csv', 'r').each do |row|
      id = row[0].to_i
      product_name = row[1]
      vendor_id = row[2].to_i


      product_list << self.new(id, product_name, vendor_id)
    end
    return product_list
  end

  def self.find(id)
    raise ArgumentError if id.class != Fixnum
    product_list = FarMar::Products.all

    product_list.each do |product|
      if product.id == id
        return product
      end
    end
    return "Not a valid id"
  end

end

#print FarMar::Products.all
