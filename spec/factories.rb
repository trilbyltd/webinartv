FactoryGirl.define do
  factory :webinar_attendee do
    webinar_id 1
    attendee_id 1
    attended ""
  end
  factory :attendee do
    name "MyString"
    email "MyString"
    active_user ""
    school_name "MyString"
  end
  factory :webinar do
    live_date "2016-04-08 16:59:51"
    title "MyString"
    description "MyString"
    presenter_id 1
    webinar_url "MyString"
    active ""
  end
end
