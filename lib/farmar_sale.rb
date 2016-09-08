require_relative '../far_mar.rb'



class FarMar::Sales

  attr_reader :id

  def initialize(id, sale_amt, date_time, vendor_id, product_id)
    @id = id
    @sale_amt = sale_amt
    @date_time = date_time
    @vendor_id = vendor_id
    @product_id = product_id
  end

  def self.all
    sale_list = []

    CSV.open('./support/sales.csv', 'r').each do |row|
      id = row[0].to_i
      sale_amt = row[1]
      date_time = row[2]
      vendor_id = row[3].to_i
      product_id = row[4].to_i


      sale_list << self.new(id, sale_amt, date_time, vendor_id, product_id)
    end
    return sale_list
  end

  def self.find(id)
    raise ArgumentError if id.class != Fixnum
    sale_list = FarMar::Sales.all

    sale_list.each do |sale|
      if sale.id == id
        return sale
      end
    end
    return "Not a valid id"
  end

end

#print FarMar::Sales.all
