# This will guess the User class
FactoryBot.define do
  
  factory :user do
    name { Faker::Name.name }
  end
end
