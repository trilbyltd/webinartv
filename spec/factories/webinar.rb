FactoryGirl.define do
  factory :webinar do
    live_date Faker::Date.between(Time.now, 3.months.from_now)
    sequence(:title) { |i| "Webinar #{i}" }
    active false

    trait :past do
      live_date Faker::Date.between(3.months.ago, Date.today)
    end
    
    trait :live do
      description "MyString"
      presenter
      webinar_url "MyString"
      active true
    end
  end
end
