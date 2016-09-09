# require_relative '../far_mar.rb'



class FarMar::Market
  extend FarMar # to access the vendor_list
  # I was going to try to put the class methods into the farmar module (dry) BUT not sure how to do that with the different csv files... probably could do that with the self.find but not sure if I am ready for that....
  attr_reader :market_id

  def initialize (market_id, name, address, city, county, state, zip)
    @market_id = market_id
    @name = name
    @address = address
    @city = city
    @county = county
    @state = state
    @zip = zip
  end

  def self.all
    market_list = []

    CSV.open('./support/markets.csv', 'r').each do |row|
      market_id = row[0].to_i
      name = row[1]
      address = row[2]
      city = row[3]
      county = row[4]
      state = row[5]
      zip = row[6].to_i

      market_list << self.new(market_id, name, address, city, county, state, zip)
    end
    return market_list
  end

  def self.find(id)
    raise ArgumentError if id.class != Fixnum
    market_list = FarMar::Market.all

    market_list.each do |market|
      if market.market_id == id
        return market
      end
    end
    return "Not a valid id"
  end

  def vendors
    vendor_list = FarMar::Vendors.all
    market_vendors = []
    vendor_list.each do |vendor|
      if vendor.market_id == @market_id
        market_vendors << vendor
      end
    end
      return market_vendors
  end
# end of class
end
# markets = FarMar::Market.all
# # find one of the markets
#  puts local_market = FarMar::Market.find(250)
# call the vendors method on that market
# local_market.vendors
