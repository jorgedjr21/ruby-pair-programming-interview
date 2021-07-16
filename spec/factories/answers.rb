FactoryBot.define do
  factory :answer do
    body { Faker::Lorem.sentence }
    question
    user
  end
end
