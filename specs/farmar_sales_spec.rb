
require_relative 'Spec_helper'
require_relative '../far_mar.rb'

describe 'Testing FarMar::Sales.all' do
  let(:sale_list) {FarMar::Sales.all}

  it "must return an array" do
    expect (sale_list).must_be_kind_of Array
  end

  it "must contain same amt of data entries as csv file" do
    expect (sale_list.length).must_equal 12798
  end

end

describe 'Testing FarMar::Sales.find(id)' do
  let(:sale) {FarMar::Sales.find(268)}
  let(:sale2) {FarMar::Sales.find("three")}
  let(:sale3) {FarMar::Sales.find(128000)}

  it "must include an id matching the argument given" do
    expect sale.sale_id.must_equal  268
  end

  it "must raise an error if object entered as argument is not a fixnum" do
    expect (proc {FarMar::Sales.find("three")} ).must_raise ArgumentError
  end

  it "must be a valid id found in the Sale list" do
   expect sale3.must_equal "Not a valid id"
  end

end

describe 'testing the FarMar::Sales methods' do
  let(:sale) {FarMar::Sales.find(268)}
  let(:sale_vendor) {sale.vendor}
  let(:sale_product) {sale.product}

  # vendor method
  it "must return a vendor with a matching vendor id as the sale vendor id" do
    expect sale_vendor.must_equal 58
  end

  # product method
  it "must return a product id matching that of the sale product id" do
    expect sale_product.must_equal 187
  end

end
