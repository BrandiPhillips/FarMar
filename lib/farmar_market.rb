require_relative '../far_mar.rb'



class FarMar::Market
  # extend FarMar # I was going to try to put the class methods into the farmar module (dry) BUT not sure how to do that with the different csv files... probably could do that with the self.find but not sure if I am ready for that....
  attr_reader :id

  def initialize(id, name, address, city, county, state, zip)
    @id = id
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
      id = row[0].to_i
      name = row[1]
      address = row[2]
      city = row[3]
      county = row[4]
      state = row[5]
      zip = row[6].to_i

      market_list << self.new(id, name, address, city, county, state, zip)
    end
    return market_list
  end

  def self.find(id)
    raise ArgumentError if id.class != Fixnum
    market_list = FarMar::Market.all

    market_list.each do |market|
      if market.id == id
        return market
      end
    end
    return "Not a valid id"
  end

end

#print FarMar::Market.all
