FactoryBot.define do
  factory :question do
    title { "MyString" }
    is_private { false }
    user
  end
end
