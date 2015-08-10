require 'rails_helper'
require 'factory_girl_rails'

describe User do
  
## Instance Method Tests Start

  describe '#current_bottles' do
    before do
      @user = build(:user)
      @address = build(:address)
      @address.user_id = @user.id
      @address.generate_btc_address_and_keys
      @address.save
      @user.save
    end

        it 'should return an array of bottles that where is_sold is false' do
          expect(@user.current_bottles).to include @address
        end

  end

  describe '#former_bottles' do
    before do
      @user = build(:user)
      @address = build(:address)
      @address.user_id = @user.id
      @address.is_sold = true
      @address.generate_btc_address_and_keys
      @address.save
      @user.save
    end

        it 'should return an array of bottles that where is_sold is true' do
          expect(@user.former_bottles).to include @address
        end

  end

## Instance Method Tests End





  it "is valid with a name, email, password, city, and country" do
    user = User.new(
      name: "Anna",
      email: "anna@annaershova.com",
      password: "Mittens1",
      city: "Moscow",
      country: "Russia")
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(name: nil)
    expect(user).to_not be_valid
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a email" do
    user = User.new(email: nil)
    expect(user).to_not be_valid
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a password" do
    user = User.new(password: nil)
    expect(user).to_not be_valid
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid without a city" do
    user = User.new(city: nil, country: nil)
    expect(user).to_not be_valid
    expect(user.errors[:city]).to include("can't be blank")
  end

  it "is invalid without a country" do
    user = User.new(country: nil)
    expect(user).to_not be_valid
    expect(user.errors[:country]).to include("can't be blank")
  end

  # test for length of password -- devise is working correctly
  it "is invalid with a password that is too short" do
    user = User.new(password: "Mittens")
    expect(user).to_not be_valid
    expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
  end

end

