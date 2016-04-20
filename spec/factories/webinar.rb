FactoryGirl.define do
  factory :webinar do
    live_date Faker::Date.between(7.days.ago, 3.months.from_now)
    sequence(:title) { |i| "Webinar #{i}" }
    active false

    trait :live do
      description "MyString"
      presenter
      webinar_url "MyString"
    end
  end
end
