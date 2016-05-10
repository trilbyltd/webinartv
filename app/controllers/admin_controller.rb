class AdminController < ApplicationController
  before_filter :find_model
  before_action :require_login

  private

  def find_model
    @model = Admin.find(params[:id]) if params[:id]
  end
end
