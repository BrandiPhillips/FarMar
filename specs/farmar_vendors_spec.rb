require_relative 'Spec_helper'
require_relative '../far_mar.rb'

describe 'Testing FarMar::Vendors.all' do
  let(:vendor_list) {FarMar::Vendors.all}

  it "must return an array" do
    expect (vendor_list).must_be_kind_of Array
  end

  it "must contain same amt of data entries as csv file" do
    expect (vendor_list.length).must_equal 2690
  end

end

describe 'Testing FarMar::Vendors.find(id)' do
  let(:vendor) {FarMar::Vendors.find(65)}
  let(:vendor3) {FarMar::Vendors.find(2695)}

  it "must include an id matching the argument given" do
    expect vendor.vendor_id.must_equal  65
  end

  it "must raise an error if object entered as argument is not a fixnum" do
    expect (proc {FarMar::Vendors.find("three")} ).must_raise ArgumentError
  end

  it "must be a valid id found in the vendor list" do
   expect vendor3.must_equal "Not a valid id"
  end

end

describe 'Test FarMar::Vendors.by_market ' do
  let(:vendors) {FarMar::Vendors.by_market(50)}
  let(:vendors3) {FarMar::Vendors.by_market(600)}

  it "must return an array if markets id is valid" do
    expect vendors.must_be_kind_of Array
  end

  it "must raise an error if object entered as argument is not a fixnum" do
    expect (proc {FarMar::Vendors.by_market("three")} ).must_raise ArgumentError
  end

  it "must be a valid id found in the vendor list" do
   expect vendors3.must_equal "not a valid market id"
  end

end

describe 'testing the FarMar::Vendors methods' do
  let(:vendor) {FarMar::Vendors.find(65)}
  let(:vend_market) {vendor.market}
  let(:vend_prod) {vendor.products}
  let(:vend_sales) {vendor.sales}
  let(:vend_revenue) {vendor.revenue}

  # market method
  it "must return a valid market id" do
    expect vend_market.must_equal 14
  end
  # product method
  it "must return an array of products for .products" do
    expect vend_prod.must_be_kind_of Array
  end

  it "must be valid vendor id's for products" do
    expect vend_prod[0].vendor_id.must_equal 65
  end
  # sales method
  it "must return an array of sales for that vendor" do
    expect vend_sales.must_be_kind_of Array
  end

  it "must be valid vendor id's for sales" do
    expect vend_sales[0].vendor_id.must_equal 65
  end

  # revenue method
  it "must return an accurate sum of sales" do
   expect vend_revenue.must_equal 17812
  end

end

# I feel like my tests are too specific.  If I were to change things in the future they would not be pertenant but not really sure how else to do it...
