FactoryGirl.define do
  factory :user do
    id 3
    name "Anna"
    email "anna@ershova.com"
    password "Mittens1"
    city "New York"
    country "USA"
  end

  factory :address do
    vineyard_name "Trump Winery"
    wine_type "Drop of Donald"
    vintage 1999
    provenance "Virginia"
  end
  
end
