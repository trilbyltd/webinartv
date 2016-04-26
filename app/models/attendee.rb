class Attendee < ActiveRecord::Base
  # has_and_belongs_to_many :webinars, :join_table => "webinar_attendees"
  has_many :webinars, through: :webinar_attendees
  has_many :webinar_attendees, dependent: :destroy

  accepts_nested_attributes_for :webinar_attendees

  validates_presence_of :name, message: "Please provide your name"
  validates_presence_of :email, message: "Please supply your email address so we can send you the webinar information." 
  validates :email, email: { message: "That email doesn't appear to be valid" }
  validates :school_name, presence: true  
  default_scope { order('name asc') }
  
  def register(webinar)
    webinar_attendees.create(webinar_id: webinar.id, attendee_id: self.id)
  end  
  
  def registered?(webinar)
    WebinarAttendee.where(webinar_id: webinar.id, attendee_id: self.id).present?
  end  
  

  def attended(webinar)
    WebinarAttendee.where(webinar_id: webinar.id, attendee_id: self.id).first.update!(attended: true)
  end

  def attended?(webinar)
    WebinarAttendee.where(webinar_id: webinar.id, attendee_id: self.id).take.attended?
  end
end
