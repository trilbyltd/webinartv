class WebinarAttendeesController < ApplicationController
  before_action :set_webinar_attendee, only: [:show, :edit, :update, :destroy, :attended]
  
  def new
    @webinar_attendee = WebninarAttendee.new
  end

  def create
    @attendee = Attendee.create_with(:attendees_attributes).find_or_create_by!(email: [:attendees_attributes][:email])
    @webinar = Webinar.find(params[:attendee][:webinar_id])
    if @attendee.save
      @attendee.register(@webinar)
      redirect_to webinars_path, notice: 'Thank you for registering for this webinar.'
    else
      redirect_to join_webinar_path(@webinar)
    end
  end
  
  def destroy
    @webinar_attendee.destroy
    redirect_to webinar_attendees_url, notice: 'Webinar attendee was successfully destroyed.'
  end
  
  def attended
    @webinar_attendee = WebinarAttendee.find(params[:webinar_attendee_id])
    @webinar_attendee.update!(attended: true)
    redirect_to admin_webinar_path(@webinar_attendee.webinar), notice: 'Attendee marked as attended'

  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webinar_attendee
      @webinar_attendee = WebinarAttendee.find(params[:id]) if params[:id]
    end

    # Only allow a trusted parameter "white list" through.
    def webinar_attendee_params
      params.require(:webinar_attendee).permit(:webinar_id, :attendee_id, :attended, attendees_attributes: [:id, :name, :email, :school_name, :active] )
    end
end
