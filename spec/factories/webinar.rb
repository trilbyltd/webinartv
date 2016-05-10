FactoryGirl.define do
  factory :webinar do
    live_date Faker::Date.between(Time.now, 3.months.from_now)
    sequence(:title) { |i| "Webinar #{i}" }

    trait :past do
      live_date Faker::Date.between(3.months.ago, Time.now)
    end

    trait :publishable do
      description "MyDescription"
      presenter
      webinar_url "http://example.com"
    end
    
    trait :live do
      description "MyDescription"
      presenter
      webinar_url "http://example.com"
      active true
    end
  end
end
