FactoryBot.define do
  factory :question do
    title { Faker::Lorem.sentence }
    is_private { false }
    user
  end

  trait :with_answer do
    after(:create) do |question| 
      create(:answer, question: question)
    end
  end
end
