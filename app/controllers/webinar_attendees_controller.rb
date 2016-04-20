class WebinarAttendeesController < ApplicationController
  before_action :set_webinar_attendee, only: [:show, :edit, :update, :destroy]

  def index
    @webinar_attendees = WebinarAttendee.all
  end

  def show
  end

  def new
    @webinar_attendee = WebinarAttendee.new
  end

  def edit
  end

  def create
    @webinar_attendee = WebinarAttendee.new(webinar_attendee_params)

    if @webinar_attendee.save
      redirect_to @webinar_attendee, notice: 'Webinar attendee was successfully created.'
    else
      render :new
    end
  end

  def update
    if @webinar_attendee.update(webinar_attendee_params)
      redirect_to @webinar_attendee, notice: 'Webinar attendee was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @webinar_attendee.destroy
    redirect_to webinar_attendees_url, notice: 'Webinar attendee was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webinar_attendee
      @webinar_attendee = WebinarAttendee.find(params[:id]) if params[:id]
    end

    # Only allow a trusted parameter "white list" through.
    def webinar_attendee_params
      params.require(:webinar_attendee).permit(:webinar_id, :attendee_id, :attended)
    end
end
