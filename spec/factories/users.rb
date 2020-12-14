FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'Password123!' }
    confirmed_at { Time.current }
  end
end
