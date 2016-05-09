class Webinar < ActiveRecord::Base
  has_many :attendees, through: :webinar_attendees
  has_many :webinar_attendees, dependent: :destroy
  belongs_to :presenter

  validates :live_date, presence: true
  validates :title, presence: { message: "Please provide a title" }
  validate :webinar_cant_be_in_the_past
  
  with_options on: :publish do
    validates :presenter_id, presence: true
    validates :webinar_url, presence: true
    validates :description, presence: true
  end

  scope :active, -> { where active: true }
  default_scope { order('live_date asc') }
  
  def self.upcoming
     where('live_date >= ?', Time.now) 
  end

  def self.past
     where('live_date < ?', Time.now) 
  end  

  def live?
    if live_date > Time.now && active?
      return true
    end
  end
  
  def active?
    self.active == true
  end

  def activate!
    self.update!(active: true)
  end

  def viewable?
    valid? :publish
  end

  private

  def webinar_cant_be_published
      # errors.add :webinar, "Please complete all the required fields"
  end

  def webinar_cant_be_in_the_past
    if !live_date.blank? and live_date < Time.now
      errors.add(:live_date, "You can't schedule a webinar in the past")
    end
  end

end
