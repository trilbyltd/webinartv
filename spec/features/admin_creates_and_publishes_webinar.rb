require "rails_helper"

RSpec.feature "Admin creates a webinar" do
  let(:webinar) { create(:webinar) }
  
  scenario "with basic details then updates and publishes" do
    visit edit_admin_webinar_path(webinar)
    fill_in "Webinar URL", with: "http://www.google.com"
    fill_in "Description", with: "lLorem ipsum dolor sit amet, consectetur adipiscing elit." 
    fill_in "Presenter", with: presenter
    click_button("Save")
    expect(page).to have_content("Webinar was successfully updated.")
    visit admin_webinar_path(webinar)
    expect(page).to have_button("Publish")
    click_button("Publish")
    expect(page).to have_content("Thanks for registering. A confirmation email has been sent to: john@example.com")
  end

  def expect_page_to_display_sign_in_error
    expect(page.body).to include(
      I18n.t("flashes.failure_after_create", sign_up_path: sign_up_path)
    )
  end
end
