FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:name) { |n| "User#{n}first Last#{n}" }
    password "password"
    password_confirmation "password"
  end
end
