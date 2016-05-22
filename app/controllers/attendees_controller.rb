class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :update, :destroy]
  before_action :require_login, except: [:new, :create]

  def index
    @attendees = Attendee.all
  end

  def show
  end

  def new
    @attendee = Attendee.new
    @webinar_attendees = @attendee.webinar_attendees.build
  end

  def create
    @attendee = Attendee.find_or_initialize_by(email: attendee_params[:email])
    @webinar = Webinar.find(attendee_params[:webinar_id])
    @attendee.attributes = attendee_params.except(:webinar_id)
    if @attendee.save
      @attendee.register_and_email(@webinar)
      redirect_to webinar_path(@webinar), notice: "Thanks for registering. A confirmation email has been sent to: #{@attendee.email}"
    else
      render 'webinars/show', notice: "Unable to complete registration. Please try again."
    end
  end

  def update
    if @attendee.update(attendee_params)
      redirect_to @attendee, notice: 'Attendee details were updated.'
    else
      render 'webinars/show'
    end
  end

  def destroy
    @attendee.destroy
    redirect_to attendees_url, notice: 'Attendee was successfully deleted.'
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
        :contact_number,
        :notes,
        :webinar_id
        )
    end
end
