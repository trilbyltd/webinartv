require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe WebinarAttendeesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # WebinarAttendee. As you add validations to WebinarAttendee, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WebinarAttendeesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all webinar_attendees as @webinar_attendees" do
      webinar_attendee = WebinarAttendee.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:webinar_attendees)).to eq([webinar_attendee])
    end
  end

  describe "GET #show" do
    it "assigns the requested webinar_attendee as @webinar_attendee" do
      webinar_attendee = WebinarAttendee.create! valid_attributes
      get :show, {:id => webinar_attendee.to_param}, valid_session
      expect(assigns(:webinar_attendee)).to eq(webinar_attendee)
    end
  end

  describe "GET #new" do
    it "assigns a new webinar_attendee as @webinar_attendee" do
      get :new, {}, valid_session
      expect(assigns(:webinar_attendee)).to be_a_new(WebinarAttendee)
    end
  end

  describe "GET #edit" do
    it "assigns the requested webinar_attendee as @webinar_attendee" do
      webinar_attendee = WebinarAttendee.create! valid_attributes
      get :edit, {:id => webinar_attendee.to_param}, valid_session
      expect(assigns(:webinar_attendee)).to eq(webinar_attendee)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new WebinarAttendee" do
        expect {
          post :create, {:webinar_attendee => valid_attributes}, valid_session
        }.to change(WebinarAttendee, :count).by(1)
      end

      it "assigns a newly created webinar_attendee as @webinar_attendee" do
        post :create, {:webinar_attendee => valid_attributes}, valid_session
        expect(assigns(:webinar_attendee)).to be_a(WebinarAttendee)
        expect(assigns(:webinar_attendee)).to be_persisted
      end

      it "redirects to the created webinar_attendee" do
        post :create, {:webinar_attendee => valid_attributes}, valid_session
        expect(response).to redirect_to(WebinarAttendee.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved webinar_attendee as @webinar_attendee" do
        post :create, {:webinar_attendee => invalid_attributes}, valid_session
        expect(assigns(:webinar_attendee)).to be_a_new(WebinarAttendee)
      end

      it "re-renders the 'new' template" do
        post :create, {:webinar_attendee => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested webinar_attendee" do
        webinar_attendee = WebinarAttendee.create! valid_attributes
        put :update, {:id => webinar_attendee.to_param, :webinar_attendee => new_attributes}, valid_session
        webinar_attendee.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested webinar_attendee as @webinar_attendee" do
        webinar_attendee = WebinarAttendee.create! valid_attributes
        put :update, {:id => webinar_attendee.to_param, :webinar_attendee => valid_attributes}, valid_session
        expect(assigns(:webinar_attendee)).to eq(webinar_attendee)
      end

      it "redirects to the webinar_attendee" do
        webinar_attendee = WebinarAttendee.create! valid_attributes
        put :update, {:id => webinar_attendee.to_param, :webinar_attendee => valid_attributes}, valid_session
        expect(response).to redirect_to(webinar_attendee)
      end
    end

    context "with invalid params" do
      it "assigns the webinar_attendee as @webinar_attendee" do
        webinar_attendee = WebinarAttendee.create! valid_attributes
        put :update, {:id => webinar_attendee.to_param, :webinar_attendee => invalid_attributes}, valid_session
        expect(assigns(:webinar_attendee)).to eq(webinar_attendee)
      end

      it "re-renders the 'edit' template" do
        webinar_attendee = WebinarAttendee.create! valid_attributes
        put :update, {:id => webinar_attendee.to_param, :webinar_attendee => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested webinar_attendee" do
      webinar_attendee = WebinarAttendee.create! valid_attributes
      expect {
        delete :destroy, {:id => webinar_attendee.to_param}, valid_session
      }.to change(WebinarAttendee, :count).by(-1)
    end

    it "redirects to the webinar_attendees list" do
      webinar_attendee = WebinarAttendee.create! valid_attributes
      delete :destroy, {:id => webinar_attendee.to_param}, valid_session
      expect(response).to redirect_to(webinar_attendees_url)
    end
  end

end
