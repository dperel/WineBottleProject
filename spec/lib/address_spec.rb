require 'rails_helper'

describe Address do

  it "is valid with a vineyard name, wine type, vintage, provenance" do
    address = Address.new(
      vineyard_name: "Chateau St Croix",
      wine_type: "Pinot Noir 2012",
      vintage: "2012",
      provenance: "St. Croix Falls, WI"
      )
    expect(address).to be_valid
  end

  it "is invalid without a vineyard name" do
    address = Address.new(vineyard_name: nil)
    expect(address).to_not be_valid
  end

  it "is invalid without a wine type" do
    address = Address.new(wine_type: nil)
    expect(address).to_not be_valid
  end

  it "is invalid without a vintage" do
    address = Address.new(vintage: nil)
    expect(address).to_not be_valid
  end

  it "is invalid without a provenance" do
    address = Address.new(provenance: nil)
    expect(address).to_not be_valid
  end

end

