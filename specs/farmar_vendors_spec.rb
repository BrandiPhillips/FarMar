require_relative 'Spec_helper'
require_relative '../lib/farmar_vendors'

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
  let(:vendor2) {FarMar::Vendors.find("three")}
  let(:vendor3) {FarMar::Vendors.find(2695)}

  it "must include an id matching the argument given" do
    expect vendor.id.must_equal  65
  end

  it "must raise an error if object entered as argument is not a fixnum" do
    expect (proc {FarMar::Vendors.find("three")} ).must_raise ArgumentError
  end

  it "must be a valid id found in the vendor list" do
   expect vendor3.must_equal "Not a valid id"
  end

end
