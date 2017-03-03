# frozen_string_literal: true
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

  scope :newest, -> { order('live_date asc') }
  scope :oldest, -> { order('live_date desc')}
  scope :active, -> { where active: true }

  def to_s
    if live_date?
      "#{title} (#{live_date.strftime('%d/%m/%Y')})"
    else
      title.to_s
    end
  end

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
    return true if live_date.past? && WebinarAttendee.where(attendee_id: attendee.id, webinar_id: id).first.attended == false
  end

  def to_ics
    calendar = Icalendar::Calendar.new
    calendar.event do |e|
      e.summary = title + ' (Webinar)'
      e.description = description
      e.dtstart = Icalendar::Values::DateTime.new(live_date)
      e.dtend = Icalendar::Values::DateTime.new(live_date + 1.hour)
      e.alarm do |a|
        a.action = 'DISPLAY'
        a.trigger = '-P0DT0H15M0S'
        a.description = 'Reminder'
      end
    end
    calendar.timezone do |t|
      t.tzid = 'Europe/London'
      t.daylight do |d|
        d.tzname = 'BST'
        d.dtstart = Icalendar::Values::DateTime.new(live_date)
      end
    end
    calendar.to_ical
  end

  private

  def webinar_cant_be_in_the_past
    return unless live_date.present? && live_date < Time.now
    errors.add(:live_date, "can't schedule a webinar in the past")
  end
end
