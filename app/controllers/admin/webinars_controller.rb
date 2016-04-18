class Admin::WebinarsController < ApplicationController
  before_action :set_webinar, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:edit, :update, :destroy]

  def index
    @webinars = Webinar.all
  end

  def show
    if @webinar.presenter_id.present?
      @presenter = Presenter.find(@webinar.presenter_id)
    end
  end

  def new
    @webinar = Webinar.new
  end

  def edit
  end

  def create
    @webinar = Webinar.new(webinar_params)

    if @webinar.save
      redirect_to admin_webinars_path, notice: 'Webinar was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /webinars/1
  def update
    if @webinar.update(webinar_params)
      redirect_to admin_webinars_path, notice: 'Webinar was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @webinar.destroy
    redirect_to webinars_url, notice: 'Webinar was successfully destroyed.'
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