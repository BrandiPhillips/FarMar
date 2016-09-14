
require_relative 'Spec_helper'
require_relative '../far_mar.rb'

describe 'Testing FarMar::Products.all' do
  let(:product_list) {FarMar::Products.all}

  it "must return an array" do
    expect (product_list).must_be_kind_of Array
  end

  it "must contain same amt of data entries as csv file" do
    expect (product_list.length).must_equal 8193
  end

end

describe 'Testing FarMar::Products.find(id)' do
  let(:product) {FarMar::Products.find(58)}
  let(:product2) {FarMar::Products.find("three")}
  let(:product3) {FarMar::Products.find(8200)}

  it "must include an id matching the argument given" do
    expect product.product_id.must_equal  58
  end

  it "must raise an error if object entered as argument is not a fixnum" do
    expect (proc {FarMar::Products.find("three")} ).must_raise ArgumentError
  end

  it "must be a valid id found in the Product list" do
   expect product3.must_equal "Not a valid id"
  end

end


describe 'testing the FarMar::Products methods' do
  let(:product) {FarMar::Products.find(58)}
  let(:product_vendor) {product.vendor}
  let(:product_sales) {product.sales}
  let(:sales_total) {product.total}

  # vendor method
  it "must return a vendor with a matching vendor id as the vendor id in the product data" do
    expect product_vendor.must_equal 20
  end
  # sales method
  it "must return an array of sales for a product instance" do
    expect product_sales.must_be_kind_of Array
  end

  it "must be valid product id (found in the data)" do
    expect product_sales[0].product_id.must_equal 58
  end

  # total method
  it "must return an accurate number of sales" do
   expect sales_total.must_equal 5
  end

end
