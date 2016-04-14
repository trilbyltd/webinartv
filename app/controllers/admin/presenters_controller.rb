class Admin::PresentersController < ApplicationController
  before_action :set_presenter, only: [:show, :edit, :update, :destroy]

  # GET /presenters
  def index
    @presenters = Presenter.all
  end

  # GET /presenters/1
  def show
  end

  # GET /presenters/new
  def new
    @presenter = Presenter.new
  end

  # GET /presenters/1/edit
  def edit
  end

  # POST /presenters
  def create
    @presenter = Presenter.new(presenter_params)

    if @presenter.save
      redirect_to @presenter, notice: 'Presenter was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /presenters/1
  def update
    if @presenter.update(presenter_params)
      redirect_to @presenter, notice: 'Presenter was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /presenters/1
  def destroy
    @presenter.destroy
    redirect_to presenters_url, notice: 'Presenter was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presenter
      @presenter = Presenter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def presenter_params
      params.require(:presenter).permit(:name, :email, :bio)
    end
end
