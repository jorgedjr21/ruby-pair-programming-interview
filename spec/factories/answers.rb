FactoryBot.define do
  factory :answer do
    body { "This is a body message" }
    question
    user
  end
end
