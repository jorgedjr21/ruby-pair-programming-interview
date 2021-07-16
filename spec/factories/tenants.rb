FactoryBot.define do
  factory :tenant do
    name { Faker::Company.name }
    api_key { Faker::Alphanumeric.alpha(number: 20) }
  end
end
