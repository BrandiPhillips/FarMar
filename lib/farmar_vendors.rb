require_relative '../far_mar.rb'



class FarMar::Vendors

  attr_reader :id

  def initialize(id, vendor_name, num_ees, market_id)
    @id = id
    @vendor_name = vendor_name
    @num_ees = num_ees
    @market_id = market_id
  end

  def self.all
    vendor_list = []

    CSV.open('./support/vendors.csv', 'r').each do |row|
      id = row[0].to_i
      vendor_name = row[1]
      num_ees = row[2]
      market_id = row[3]


      vendor_list << self.new(id, vendor_name, num_ees, market_id)
    end
    return vendor_list
  end

  def self.find(id)
    raise ArgumentError if id.class != Fixnum
    vendor_list = FarMar::Vendors.all

    vendor_list.each do |vendor|
      if vendor.id == id
        return vendor
      end
    end
    return "Not a valid id"
  end

end

#print FarMar::Vendor.all
