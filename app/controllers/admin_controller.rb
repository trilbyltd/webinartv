class AdminController < ApplicationController
  before_filter :find_model

  

  private
  def find_model
    @model = Admin.find(params[:id]) if params[:id]
  end
end
