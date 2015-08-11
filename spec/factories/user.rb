FactoryGirl.define do

  factory :user do
    id 3 # for testing instance methods
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(10, 20) }
    city { Faker::Address.city }
    country { Faker::Address.country }
    created_at Time.now
    updated_at Time.now
  end

end