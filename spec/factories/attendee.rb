FactoryGirl.define do
  factory :attendee do
    name Faker::Name.name
    email "support@trilbytv.co.uk"
    school_name Faker::Educator.secondary_school
  end
end
