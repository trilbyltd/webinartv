class Admin::AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy]

  # GET /attendees
  def index
    @attendees = Attendee.all
  end

  # GET /attendees/1
  def show
    @webinars = @attendee.webinars
  end

  # GET /attendees/new
  def new
    @attendee = Attendee.new
  end

  # GET /attendees/1/edit
  def edit
  end

  # POST /attendees
  def create
    @attendee = Attendee.new(attendee_params)

    if @attendee.save
      redirect_to @attendee, notice: 'Attendee was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /attendees/1
  def update
    if @attendee.update(attendee_params)
      redirect_to @attendee, notice: 'Attendee was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /attendees/1
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
