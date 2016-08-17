require "rails_helper"

feature "Visitor registers for webinar" do
  let(:webinar) { create(:webinar, :live) }
  
  scenario "with valid details and valid email" do
    visit join_webinar_path(webinar)
    fill_in "Name", with: "John Smith", match: :prefer_exact
    fill_in "Email", with: "john@example.com" 
    fill_in "School Name", with: "Fake School"
    fill_in "Contact number", with: "01234 567890"
    click_button(t("webinars.show.submit"))

    expect(current_path).to eq webinar_path(webinar)
    expect(page).to have_content("Thanks for registering. A confirmation email has been sent to: john@example.com")
  end

  scenario "with valid mixed-case email and password " do
  end

  def expect_page_to_display_sign_in_error
    expect(page.body).to include(
      I18n.t("flashes.failure_after_create", sign_up_path: sign_up_path)
    )
  end
end
