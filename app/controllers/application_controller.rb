# frozen_string_literal: true
class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def record_not_found
    render 'shared/not_found' # Assuming you have a template named 'record_not_found'
  end
end
