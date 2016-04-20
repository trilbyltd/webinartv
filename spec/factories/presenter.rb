FactoryGirl.define do
  factory :presenter do
    name Faker::Name.name
    email "support@trilbytv.co.uk"
    bio Faker::Name.title
  end
end
