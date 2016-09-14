# frozen_string_literal: true
class Presenter < ActiveRecord::Base
  has_many :webinars

  validates :name, presence: true
  validates :email, presence: true, email: true
  validates :bio, presence: true

  default_scope { order('name asc') }

  def to_s
    name
  end
end
