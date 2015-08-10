FactoryGirl.define do 
  factory :user do 
    name "Anna"
    email "anna@annaershova.com"
    password "Mittens1"
    city "Moscow"
    country "Russia"
    business_name "Awesome Vineyard"
    created_at Time.now
    updated_at Time.now
  end
end