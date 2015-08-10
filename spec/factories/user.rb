FactoryGirl.define :user do |f|
  f.sequence(:name) { |n| "Anna" }
  f.password "Mittens1"
  f.password_confirmation { |u| u.password }
  f.sequence(:email) { |n| "anna@example.com" }
  f.sequence(:city) { |n| "Moscow" }
  f.sequence(:country) { |n| "Russia" }
end

