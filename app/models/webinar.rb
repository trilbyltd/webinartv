class Webinar < ActiveRecord::Base
  has_many :attendees, through: :webinar_attendees
  has_many :webinar_attendees, dependent: :destroy

  belongs_to :presenter

  validates :live_date, presence: true
  validates :title, presence: true
  validates_presence_of :presenter_id, on: :view
  validates_presence_of :webinar_url, on: :view
  validates_presence_of :description, on: :view
  # validate :live_date, if: :webinar_cant_be_in_the_past?
  
  # validates :description, presence: true, if: Proc.new { |a| a.active? }
  # validates :webinar_url, presence: true, if: Proc.new { |a| a.active? }

  scope :active, -> { where active: true }
  default_scope { order('live_date asc') }
  
  def self.upcoming
     where('live_date >= ?', Date.today) 
  end

  def self.past
     where('live_date < ?', Date.today) 
  end

  def live?
    if live_date > Time.now - 20.minutes
      return true
    end
  end

  def activate!
    self.update!(active: true)
  end

  def viewable?
    valid? :view 
  end

  private

  def webinar_cant_be_published
    errors.add :webinar, "doesn't have enough details"
  end

  def webinar_cant_be_in_the_past
    live_date < Date.today
    errors.add :webinar, "can't be in the past"
  end

end
