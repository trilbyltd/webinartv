class WebinarsController < ApplicationController
  before_action :set_webinar, only: [:show, :edit, :update, :destroy, :join]

  def index
    @webinars = Webinar.active.all
  end

  def show
  end

  def join
    @attendee = @webinar.attendee.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webinar
      @webinar = Webinar.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def webinar_params
      params.require(:webinar).permit(:live_date, :title, :description, :presenter_id, :webinar_url, :active)
    end
end
