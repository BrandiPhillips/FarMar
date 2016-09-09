# require_relative '../far_mar.rb'



class FarMar::Products
  # extend FarMar
  attr_reader :product_id, :vendor_id

  def initialize(product_id, product_name, vendor_id)
    @product_id = product_id
    @product_name = product_name
    @vendor_id = vendor_id
  end

  def self.all
    product_list = []

    CSV.open('./support/products.csv', 'r').each do |row|
      product_id = row[0].to_i
      product_name = row[1]
      vendor_id = row[2].to_i


      product_list << self.new(product_id, product_name, vendor_id)
    end
    return product_list
  end

  def self.find(id)
    raise ArgumentError if id.class != Fixnum
    product_list = FarMar::Products.all

    product_list.each do |product|
      if product.product_id == id
        return product
      end
    end
    return "Not a valid id"
  end

end

#print FarMar::Products.all
