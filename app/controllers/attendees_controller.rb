class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :update, :destroy]
  before_action :require_login, except: [:new, :create]

  def index
    @attendees = Attendee.all
  end

  def show
    @webinars = @attendee.webinars
  end

  def new
    @attendee = Attendee.new
    @webinar_attendees = @attendee.webinar_attendees.build
  end

  def create
    @attendee = Attendee.create_with(name: attendee_params[:name], 
      email: attendee_params[:email], 
      school_name: attendee_params[:school_name]).find_or_create_by(email: attendee_params[:email])
    @webinar = Webinar.find(attendee_params[:webinar_attendees_attributes][:webinar_id])
    if @attendee.save
      @attendee.register(@webinar)
      WebinarMailer.webinar_registration(@attendee, @webinar).deliver_later
      redirect_to webinar_path(@webinar), notice: "Thanks for registering. A confirmation email has been sent to: #{@attendee.email}"
    else
      redirect_to join_webinar_path(@webinar), notice: "Unable to complete registration. Please try again."
    end
  end

  def update
    if @attendee.update(attendee_params)
      redirect_to @attendee, notice: 'Attendee was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @attendee.destroy
    redirect_to attendees_url, notice: 'Attendee was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendee
      @attendee = Attendee.find(params[:id]) if params[:id]
    end

    # Only allow a trusted parameter "white list" through.
    def attendee_params
      params.require(:attendee).
      permit(:name, 
        :email, 
        :active_user, 
        :school_name, 
        webinar_attendees_attributes: [ :webinar_id ] 
        )
    end
end
