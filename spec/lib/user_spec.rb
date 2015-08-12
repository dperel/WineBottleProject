require 'rails_helper'
require 'factory_girl_rails'

describe User do

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end
  
  describe 'associtations' do

    describe "has mandatory attritbutes and is invalid without either of those" do
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
      it "is invalid with a password that is too short" do
        user = build(:user, password: Faker::Internet.password(6) )
        expect(user).to_not be_valid
        expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
      end
    end

   describe "has correct timestamps" do 
    it "knows when it was created" do
      user = build(:user)
      expect {user.created_at}.to_not raise_error
      expect(user.created_at.to_datetime === Time.now.utc.to_datetime).to eq(true)
    end
    it "knows when it was updated" do
      user = build(:user)
      user = build(:user, name: Faker::Name.name)
      expect {user.updated_at}.to_not raise_error
      expect(user.updated_at.to_datetime ===  Time.now.utc.to_datetime).to eq(true)
      expect(user.updated_at.to_datetime).to be > user.created_at.to_datetime
    end
  end

  end # ends descibe associations

  describe 'instance methods' do

    before do
        @user = build(:user, id: 3)
        @address = build(:address)
        @address.user_id = @user.id
        @address.generate_btc_address_and_keys
        @address.save
        @user.save
    end

    describe '#current_bottles' do
      it 'should return an array of bottles that where is_sold is false' do
        expect(@user.current_bottles).to include @address
      end
      it 'is an array' do
        expect(@user.former_bottles.to_a).to be_an Array 
      end
    end # end #current bottles

    describe '#former_bottles' do
      it 'should return an array of bottles that where is_sold is true' do
        @address.is_sold = true
        expect(@user.former_bottles).to include @address
      end
      it 'is an array' do
        @address.is_sold = true
        expect(@user.former_bottles.to_a).to be_an Array 
      end
    end # end #former bottles

  end # end instance methods

end

