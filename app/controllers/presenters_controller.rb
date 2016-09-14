# frozen_string_literal: true
class PresentersController < ApplicationController
  before_action :set_presenter, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  def index
    @presenters = Presenter.all
  end

  def show
  end

  def new
    @presenter = Presenter.new
  end

  def edit
  end

  def create
    @presenter = Presenter.new(presenter_params)

    if @presenter.save
      redirect_to presenters_path, notice: 'Presenter was successfully created.'
    else
      render :new
    end
  end

  def update
    if @presenter.update(presenter_params)
      redirect_to presenters_path, notice: 'Presenter was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @presenter.destroy
    redirect_to presenters_url, notice: 'Presenter was successfully destroyed.'
  end

  private

  def set_presenter
    @presenter = Presenter.find(params[:id]) if params[:id]
  end

  def presenter_params
    params.require(:presenter).permit(:name, :email, :bio)
  end
end
