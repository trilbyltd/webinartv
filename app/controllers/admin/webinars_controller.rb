# frozen_string_literal: true
module Admin
  class WebinarsController < ApplicationController
    before_action :set_webinar, only: [:show, :edit, :update, :publish, :destroy, :download, :duplicate]
    before_action :require_login

    def index
      @webinars = Webinar.includes(:presenter).all
    end

    def show
      if @webinar.presenter_id.present?
        @presenter = Presenter.find(@webinar.presenter_id)
      end
      respond_to do |format|
        format.html
        format.ics do
          render text: ''.html_safe + @webinar.to_ics
        end
      end
    end

    def download
      @webinar = Webinar.find(params[:webinar_id]) if params[:webinar_id]
    end

    def duplicate
      @existing_webinar = Webinar.find(params[:webinar_id])
      @webinar = Webinar.new(@existing_webinar.attributes)
      render :new
    end

    def new
      @webinar = Webinar.new
    end

    def edit
    end

    def create
      @webinar = Webinar.new(webinar_params)
      if @webinar.save
        redirect_to admin_webinar_path(@webinar), notice: 'Webinar was successfully created.'
      else
        render :new
      end
    end

    def publish
      @webinar = Webinar.find(params[:webinar_id]) if params[:webinar_id]
      if @webinar.activate!
        redirect_to @webinar, notice: 'Webinar is now public.'
      else
        render :show, notice: 'Unable to publish. Please try again.'
      end
    end

    def update
      if @webinar.update(webinar_params)
        redirect_to admin_webinar_path(@webinar), notice: 'Webinar was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @webinar.destroy
      redirect_to admin_webinars_path, notice: 'Webinar was successfully deleted.'
    end

    private

    def set_webinar
      @webinar = Webinar.find(params[:id]) if params[:id]
    end

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
end
