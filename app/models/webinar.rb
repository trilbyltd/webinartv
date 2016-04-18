class Webinar < ActiveRecord::Base
  # has_and_belongs_to_many :attendees, :join_table => "webinar_attendees"
  has_many :webinar_attendees
  has_many :attendees, through: :webinar_attendees
  has_one :presenter

  validates :live_date, presence: true
  validates :title, presence: true

  scope :active, -> { where active: true }

  def live?
    if live_date > Time.now - 20.minutes
      return true
    end
  end

end
