require "rails_helper"
require "support/features/clearance_helpers"

feature "Admin visits dashboard", type: :feature do
  let(:webinar) { create :webinar }
  let(:user) { create :user, :admin }
  let(:presenter) { create :presenter }


  scenario "and views the index" do
    visit_admin_dashboard_as_admin
    expect(page).to have_content(t('admin.webinars.new'))
  end

    scenario "and creates a webinar" do
    presenter = create(:presenter)
    date = Time.now + 1.week
    visit_admin_dashboard_as_admin

    create_webinar(title: "MyWebinar", live_date: date.strftime("%d/%m/%Y %H:%M"))
    expect(page).to have_text("MyWebinar")
    expect(page).to have_text(date.strftime("%A, %-d %b %Y at %R"))
    # expect(page).to have_text(presenter.name)
    expect(page).to have_content("Webinar was successfully created.")
  end

  def expect_page_to_display_sign_in_error
    expect(page.body).to include(
      I18n.t("flashes.failure_after_create", sign_up_path: sign_up_path)
    )
  end

  def visit_admin_dashboard_as_admin
    visit admin_webinars_path(as: user)
  end

  def create_webinar(**options)
    attributes = attributes_for(:webinar).merge(options)
    click_on t('admin.webinars.new')
    fill_in('webinar_title', with: attributes[:title] )
    fill_in('webinar_live_date', with: attributes[:live_date])
    click_on submit(:webinar)
  end

end
