FactoryBot.define do
  factory :presenter do
    name { Faker::Name.name }
    email { "support@trilbytv.co.uk" }
    bio { Faker::Job.title }
  end
end
