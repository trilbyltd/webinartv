# frozen_string_literal: true
class WebinarsController < ApplicationController
  before_action :set_webinar, only: :show

  def index
    @webinars = Webinar.active.upcoming.includes(:presenter).newest
  end

  def show
    @attendee = @webinar.attendees.new
    respond_to do |format|
      format.html
      format.ics do
        render text: ''.html_safe + @webinar.to_ics
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_webinar
    @webinar = Webinar.find(params[:id]) if params[:id]
  rescue ActiveRecord::RecordNotFound
    redirect_to webinars_path, alert: "Sorry, we can't find that any details for that webinar. It may have already passed. Please select from the available webinars below"
  end
end
