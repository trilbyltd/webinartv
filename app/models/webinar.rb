class Webinar < ActiveRecord::Base
  has_many :attendees, through: :webinar_attendees
  has_one :presenter
  
  scope :active, -> { where active: true }

  def live?
    if live_date > Time.now - 20.minutes
      return true
    end
  end
end
