require 'rails_helper'

describe User do

  describe 'associations' do

    xit "has many addresses" do 

    end

    xit "has many transactions" do

    end

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
      user = FactoryGirl.create :user, name: nil
      expect(user).to_not be_valid
      # expect(user.errors[:name]).to include("can't be blank")
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

    it "can be a vineyard" do
      user = User.create(
        name: "Anna",
        email: "anna@annaershova.com",
        password: "Mittens1",
        city: "Moscow",
        country: "Russia",
        is_vineyard: true)
      expect(user.is_vineyard).to eq(true)
    end

    it "can have a business name" do
      user = User.create(
        name: "Anna",
        email: "anna@annaershova.com",
        password: "Mittens1",
        city: "Moscow",
        country: "Russia",
        business_name: "Awesome Vineyard")
       expect(User.find_by(business_name: "Awesome Vineyard")).to eq(user)
    end

    it "knows when it was created" do
      user = User.create(
        name: "Anna",
        email: "anna@annaershova.com",
        password: "Mittens1",
        city: "Moscow",
        country: "Russia")
      expect {user.created_at}.to_not raise_error
      expect(user.created_at.to_datetime === Time.now.utc.to_datetime).to eq(true)
    end

    it "knows when it was updated" do
      user = User.create(
        name: "Anna",
        email: "anna@annaershova.com",
        password: "Mittens1",
        city: "Moscow",
        country: "Russia")
      user.update(name: "Bob")
      expect {user.updated_at}.to_not raise_error
      expect(user.updated_at.to_datetime ===  Time.now.utc.to_datetime).to eq(true)
      expect(user.updated_at.to_datetime).to be > user.created_at.to_datetime
    end

  end # ends descibe associations

  describe 'instance methods' do
    # it 'knows about all the available listings given a date range' do
    #   expect(City.first.city_openings('2014-05-01', '2014-05-05')).to include(@listing1) 
    # end 
  end # ends instance methods

end

