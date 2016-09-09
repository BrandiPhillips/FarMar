# require_relative '../far_mar.rb'



class FarMar::Vendors

  attr_reader :market_id, :vendor_id

  def initialize(vendor_id, vendor_name, num_ees, market_id)
    @vendor_id = vendor_id
    @vendor_name = vendor_name
    @num_ees = num_ees
    @market_id = market_id
  end

  def self.all
    vendor_list = []

    CSV.open('./support/vendors.csv', 'r').each do |row|
      vendor_id = row[0].to_i
      vendor_name = row[1]
      num_ees = row[2]
      market_id = row[3].to_i


      vendor_list << self.new(vendor_id, vendor_name, num_ees, market_id)
    end
    return vendor_list
  end

  def self.find(id)
    raise ArgumentError if id.class != Fixnum
    vendor_list = FarMar::Vendors.all

    vendor_list.each do |vendor|
      if vendor.vendor_id == id
        return vendor
      end
    end
    return "Not a valid id"
  end

 # we are assuming there is only one market per vendor however, in reality vendors more than likely will attend multiple markets.  could be easily changed by having this return an array of markets like the vendor method in market class...  These methods are so similar, I feel like they could be created in module in a more general fashion and then extended into the classes...
  def market
    market_list = FarMar::Market.all

    market_list.each do |market|
      if market.market_id == @market_id
        return market
      end
    end
  end

  def products
    products_list = FarMar::Products.all
    vendor_products = []
    products_list.each do |product|
      if product.vendor_id == @vendor_id
        vendor_products << product
      end
    end
      return vendor_products
  end

  def sales
    sales_list = FarMar::Sales.all
    vendor_sales = []
    sales_list.each do |sale|
      if sale.vendor_id == @vendor_id
        vendor_sales << sale
      end
    end
      return vendor_sales
  end

  def revenue
    vendor_sales = self.sales
    total_revenue = 0
    vendor_sales.each do |sale|
      if sale.vendor_id == @vendor_id
        total_revenue += sale.sale_amt
      end
    end
    return total_revenue
  end


# end of class
end

#print FarMar::Vendor.all
