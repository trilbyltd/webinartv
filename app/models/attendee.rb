class Attendee < ActiveRecord::Base
  # has_and_belongs_to_many :webinars, :join_table => "webinar_attendees"
  has_many :webinars, through: :webinar_attendees
  has_many :webinar_attendees, dependent: :destroy
  default_scope { order('name asc') }
  
  validates_presence_of :name, message: "Please provide your name"
  validates_presence_of :email, message: "Please supply your email address so we can send you the webinar information." 
  validates :email, email: { message: "That email doesn't appear to be valid" }
  validates_presence_of :school_name
end
