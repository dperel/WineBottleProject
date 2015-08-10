require 'rails_helper'

describe User do

  describe 'associations' do

    it "is valid with a name, email, password, city, and country" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user = build(:user, name: nil)
      expect(user).to_not be_valid
    end

    it "is invalid without an email" do
      user = build(:user, email: nil)
      expect(user).to_not be_valid
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      expect(user).to_not be_valid
    end

    it "is invalid without a city" do
      user = build(:user, city: nil)
      expect(user).to_not be_valid
    end

    it "is invalid without a country" do
      user = build(:user, country: nil)
      expect(user).to_not be_valid
    end

    # test for length of password -- devise is working correctly
    it "is invalid with a password that is too short" do
      user = build(:user, password: "Mittens")
      expect(user).to_not be_valid
      expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
    end

    it "can be a vineyard" do
      user = build(:user, is_vineyard: true)
      expect(user).to be_valid
    end

    it "can have a business name" do
      user = build(:user)
      expect(user["business_name"]).to eq("Awesome Vineyard")
    end

    it "knows when it was created" do
      user = build(:user)
      expect {user.created_at}.to_not raise_error
      expect(user.created_at.to_datetime === Time.now.utc.to_datetime).to eq(true)
    end

    it "knows when it was updated" do
      user = build(:user)
      user = build(:user, name: "Bob")
      expect {user.updated_at}.to_not raise_error
      expect(user.updated_at.to_datetime ===  Time.now.utc.to_datetime).to eq(true)
      expect(user.updated_at.to_datetime).to be > user.created_at.to_datetime
    end

  end # ends descibe associations

end

