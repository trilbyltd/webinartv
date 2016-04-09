class Webinar < ActiveRecord::Base
has_many :attendees, through: :webinar_attendees

scope :active, -> { where active: true }
end
