require 'rails_helper'
require "support/features/clearance_helpers"

RSpec.describe Admin::WebinarsController do
  describe "GET index" do
    let(:user) {create(:user, admin: true) }
    let(:webinar) {create(:webinar)}
    before (:each) do
      sign_in_as(user)
    end

    it "assigns @webinars" do
      get :index
      expect(assigns(:webinars)).to eq([webinar])
    end
    it 'should render index template' do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    let(:user) {create(:user, admin: true) }
    let(:webinar) {create(:webinar)}
    before (:each) do
      sign_in_as(user)
    end
  
    it 'should respond to ics download' do
      # get :show, id: webinar.id, format: :ics
      # expect(response.body).to have_content('BEGIN:VCALENDAR')
    end
  end 

  describe "POST create" do
    let(:user) {create(:user, admin: true) }
    let(:webinar) { build_stubbed(:webinar) }
    before (:each) do
      sign_in_as(user)
    end

    it "creates a new webinar" do
      post :create, webinar: attributes_for(:webinar)
      expect(Webinar.count).to eq(1)
    end
    it 'redirects to the "show" action for the new post' do
      post :create, webinar: attributes_for(:webinar)
      expect(response).to redirect_to admin_webinar_path(assigns(:webinar))
    end
  end

end
