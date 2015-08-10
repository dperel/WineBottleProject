require 'rails_helper'

describe User do

  # let(:user) { User.find_by_id(2) }

  # let(:user) do
  #    { :name => "Anna",  :email => "anna@annaershova.com" }
  # end

  # let(:name) { "Anna" }

  it "is named Anna" do
    user = User.new
    user.name = 'Anna'
    expect(user.name).to eq("Anna")
  end

  it "has an email" do
    user = User.new
    user.email = "anna@annaershova.com"
    expect(user.email).to eq("anna@annaershova.com")
  end

  it "has a password" do
    user = User.new
    user.password = "Mittens"
    expect(user.password).to eq("Mittens")
  end

  it "has a password confirmation that is identical to the password" do
    user = User.new
    user.password_confirmation = "Mittens"
    expect(user.password_confirmation).to eq("Mittens")
  end

  it "has a password that matches password confirmation" do
    user = User.new
    user.password = "Mittens"
    user.password_confirmation = "Mittens"
    expect(user.password_confirmation).to eq(user.password)
  end

  it "is a vineyard" do
    user = User.new
    user.is_vineyard = true
    expect(user.is_vineyard).to be true  
  end
  
end

