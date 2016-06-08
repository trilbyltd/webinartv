class WebinarsController < ApplicationController
  before_action :set_webinar, only: :show

  def index
    @webinars = Webinar.active.upcoming.includes(:presenter).all
  end

  def show
    @attendee = @webinar.attendees.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webinar
      @webinar = Webinar.find(params[:id]) if params[:id]
    end
end
