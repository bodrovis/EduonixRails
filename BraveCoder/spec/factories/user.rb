FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password 'secret'
    password_confirmation 'secret'
    admin false

    trait :admin do
      admin true
    end

    factory :admin, traits: [:admin]
  end
end