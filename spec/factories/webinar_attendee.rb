FactoryGirl.define do
  factory :webinar_attendee do
    webinar
    attendee
    attended { [true, false].sample }
  end
end
