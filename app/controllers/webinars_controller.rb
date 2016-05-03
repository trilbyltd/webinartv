class WebinarsController < ApplicationController
  before_action :set_webinar, only: [:show, :join]

  def index
    @webinars = Webinar.active.includes(:presenter).all
  end

  def show
    @attendee = Attendee.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webinar
      @webinar = Webinar.find(params[:id]) if params[:id]
    end

    # Only allow a trusted parameter "white list" through.
    def webinar_params
      params.require(:webinar).permit(
        :live_date, 
        :title, 
        :description, 
        :presenter_id, 
        :webinar_url, 
        :active
        )
    end
end
