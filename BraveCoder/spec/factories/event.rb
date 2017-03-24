FactoryGirl.define do
  factory :event do
    title Faker::Book.title
    starts_at {Time.current}
    ends_at {1.day.from_now}
    category
  end
end