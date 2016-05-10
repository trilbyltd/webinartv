require "rails_helper"
require "support/features/clearance_helpers"

feature "Admin creates a webinar" do
  let(:webinar) { create(:webinar) }
  let(:user) {create(:user, :admin) }
  let(:presenter) {create(:presenter) }
  
  scenario "with complete details shows publish button" do    
    webinar = create(:webinar, :publishable)
    presenter = create(:presenter)
    visit admin_webinar_path(webinar, as: user)
    expect(page).to have_button t("admin.webinars.show.publish")      
  end

  scenario "and publishes webinar" do 
    webinar = create(:webinar, :publishable)
    sign_in_with(user.email, user.password)
    visit admin_webinar_path(webinar, as: user)
    click_button("Publish")
    expect(page).to have_content("Webinar is now public")
  end
end
