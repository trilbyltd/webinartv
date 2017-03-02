require "rails_helper"
require "support/features/clearance_helpers"

feature "Admin creates a webinar" do
  let(:webinar) { create(:webinar) }
  let(:user) { create(:user, :admin) }
  let(:presenter) {create(:presenter) }
  
  scenario "with basic details then updates and publishes", js: true, :driver => :webkit do 
    presenter = create(:presenter)
    webinar = create(:webinar)
    sign_in_with(user.email, user.password)
    visit edit_admin_webinar_path(webinar)
    fill_in "Webinar URL", with: "http://www.google.com"
    fill_in "Description", with: "Lorem ipsum dolor sit amet, consectetur adipiscing elit." 
    select(presenter.name, from: 'Presenter')
    click_button("Save")
    expect(page).to have_content(t("admin.webinars.update.update_success"))
  end

  def expect_page_to_display_sign_in_error
    expect(page.body).to include(
      I18n.t("flashes.failure_after_create", sign_up_path: sign_up_path)
    )
  end

end
