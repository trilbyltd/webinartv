FactoryGirl.define do
  factory :attendee do
    name Faker::Name.name
    email "support@trilbytv.co.uk"
    active_user { [true, false].sample }
    school_name Faker::Educator.secondary_school
  end
end
