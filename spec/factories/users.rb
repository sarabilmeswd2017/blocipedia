FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "joe user no. #{n}" }
    sequence(:email) { |n| "user#{n}@site.com" }
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.now
  end
end
