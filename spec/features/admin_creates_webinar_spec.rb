require "rails_helper"
require "support/features/clearance_helpers"

feature "Admin creates a webinar" do
  scenario "from the dashboard" do    
    presenter = create(:presenter)
    live_date = 1.week.from_now
    visit_admin_dashboard_as_admin
    date = (Time.now + 1.week)
    create_webinar(title: "MyWebinar", live_date: date.strftime("%d/%m/%Y %H:%M"), presenter: presenter.name)
    expect(page).to have_text("MyWebinar")
    expect(page).to have_text(date.strftime("%A, %-d %b %Y at %R"))
    expect(page).to have_text(presenter.name)
    expect(page).to have_content("Webinar was successfully created.")
  end

  def expect_page_to_display_sign_in_error
    expect(page.body).to include(
      I18n.t("flashes.failure_after_create", sign_up_path: sign_up_path)
    )
  end
  
  def visit_admin_dashboard_as_admin
    visit admin_webinars_path(as: create(:user, :admin))
  end

  def create_webinar(**options)
    attributes = attributes_for(:webinar).merge(options)
    click_on t("admin.webinars.new")

    fill_form_and_submit(:webinar, :new, attributes)
  end

end
