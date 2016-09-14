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

  def self.by_vendor(vendor_id)
    product_list = FarMar::Products.all
    products_by_vendor = []
    product_list.each do |product|
      if product.vendor_id == vendor_id
        products_by_vendor << product
      end
      return products_by_vendor
    end
  end

  def vendor
    return self.vendor_id
  end

  def sales
    sales_list = FarMar::Sales.all
    product_sales = []
    sales_list.each do |sale|
      if sale.product_id == @product_id
        product_sales << sale
      end
    end
      return product_sales
  end

  def total
    product_sales = self.sales
    total_sales = 0
    product_sales.each do |sale|
      if sale.product_id == @product_id
        total_sales += 1
      end
    end
    return total_sales
  end

end
