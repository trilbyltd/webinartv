FactoryBot.define do
  factory :attendee do
    name { Faker::Name.name }
    email { "support@trilbytv.co.uk" }
    school_name { Faker::Educator.secondary_school }
    contact_number { "01234567890" }
  end
end
