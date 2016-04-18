class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: :new

  def index
    @attendees = Attendee.all
  end

  def show
    @webinars = @attendee.webinars
  end

  def new
    @attendee = Attendee.new
  end

  def edit
  end

  def create
    @attendee = @webinar.attendee.build(attendee_params)
    if @attendee.save
      redirect_to webinars_path, notice: 'Thanks for registering. You should receive a confirmation email shortly.'
    else
      render :new
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
      params.require(:attendee).permit(:name, :email, :active_user, :school_name)
    end
end
