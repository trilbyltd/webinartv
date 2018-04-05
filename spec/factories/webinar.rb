FactoryBot.define do
  factory :webinar do
    sequence(:title) { |i| "Webinar #{i}" }
    live_date Faker::Date.between(1.day.from_now, 3.months.from_now)
    description "MyDescription"

    trait :past do
      live_date Faker::Date.between(3.months.ago, Time.now)
    end

    trait :publishable do
      presenter
      webinar_url "http://example.com"
    end
    
    trait :live do
      presenter
      webinar_url "http://example.com"
      active true
    end
  end
end
