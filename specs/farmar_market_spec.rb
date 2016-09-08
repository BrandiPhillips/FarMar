
require_relative 'Spec_helper'
require_relative '../lib/farmar_market'

describe 'Testing FarMar::Market.all' do
  let(:market_list) {FarMar::Market.all}

  it "must return an array" do
    expect (market_list).must_be_kind_of Array
  end

  it "must contain same amt of data entries as csv file" do
    expect (market_list.length).must_equal 500
  end

end

describe 'Testing FarMar::Market.find(id)' do
  let(:market) {FarMar::Market.find(494)}
  let(:market2) {FarMar::Market.find("three")}
  let(:market3) {FarMar::Market.find(501)}

  it "must include an id matching the argument given" do
    expect market.id.must_equal  494
  end

  it "must raise an error if object entered as argument is not a fixnum" do
    expect (proc {FarMar::Market.find("three")} ).must_raise ArgumentError
  end

  it "must be a valid id found in the market list" do
   expect market3.must_equal "Not a valid id"
  end

end
