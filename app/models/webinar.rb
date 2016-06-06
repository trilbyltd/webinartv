class Webinar < ActiveRecord::Base
  has_many :attendees, through: :webinar_attendees
  has_many :webinar_attendees, dependent: :destroy
  belongs_to :presenter
  accepts_nested_attributes_for :attendees

  validates :live_date, presence: true
  validates :title, presence: { message: 'Please provide a title' }
  validate :webinar_cant_be_in_the_past

  with_options on: :publish do
    validates :presenter_id, presence: true
    validates :webinar_url, presence: true
    validates :description, presence: true
  end  

  default_scope { order('live_date asc') }
  scope :active, -> { where active: true }

  def self.upcoming
    where('live_date >= ?', Time.now)
  end

  def self.past
    where('live_date < ?', Time.now)
  end

  def live?
    return true if live_date > Time.now && active?
  end

  def active?
    active == true
  end

  def activate!
    update!(active: true)
  end

  def viewable?
    valid? :publish
  end

  def attendable(attendee)
    return true if live_date.past? && WebinarAttendee.find(attendee: attendee, webinar: self).attended == false
  end
  
  def to_ics
    calendar = Icalendar::Calendar.new
    event = Icalendar::Event.new
    event.dtstart = self.live_date
    event.dtend = event.dtstart + 1.hour
    event.summary = self.description
    event.alarm do |a|
        a.action = "DISPLAY"
        a.trigger = "-P0DT0H15M0S"
        a.description = "Reminder"
    end
    calendar.add_event(event)
    calendar.to_ical
  end

  private

  def webinar_cant_be_in_the_past
    if live_date.present? && live_date < Time.now
      errors.add(:live_date, "can't schedule a webinar in the past") 
    end
  end
end
