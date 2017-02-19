require 'rails_helper'
RSpec.configure do |config|
  # clean out the queue after each spec
  config.after(:each) do
    ActiveJob::Base.queue_adapter.enqueued_jobs = []
    ActiveJob::Base.queue_adapter.performed_jobs = []
  end
end

describe Attendee do
  include ActiveJob::TestHelper
  include Capybara::Email::DSL

  it 'has a valid factory' do
    expect(build(:attendee)).to be_valid
  end

  let(:attendee) { build(:attendee) }

  describe "ActiveModel validations" do
    it "should validate the presence of data" do
      should validate_presence_of(:name).with_message('Please provide your name')
      should validate_presence_of(:email).with_message('Please supply your email address so we can send you the webinar information.')
      should validate_presence_of(:school_name).with_message("Please let us know where you're from")
    end
  
    it "should validate format of data" do
      should allow_value("dhh@nonopinionated.com").for(:email) 
      should_not allow_value("blah").for(:email).with_message("Email doesn't appear to be valid")
    end
  end

  context "with a live webinar" do
    let(:webinar) { create(:webinar, :live) }
    let(:attendee) { create(:attendee) }
    it "should register" do
      attendee.register(webinar)
      expect(attendee.registered?(webinar)).to be true
    end

    it "should mark as attended" do
      attendee.register(webinar)
      attendee.attended(webinar)
      expect(attendee.attended?(webinar)).to be true
    end

    it "should enqueue the email job" do
        WebinarRegistrationJob.perform_later(attendee, webinar)
        expect(ActiveJob::Base.queue_adapter.enqueued_jobs.count).to eq 1
    end

    it "should send an email once the job is performed" do
      ActiveJob::Base.queue_adapter = :test
      
      perform_enqueued_jobs do
        attendee.register_and_email(webinar)
        expect(ActiveJob::Base.queue_adapter.enqueued_jobs.count).to eq 0
        expect { attendee.register_and_email(webinar) }.to change { ActionMailer::Base.deliveries.count }.by(2)
      end
      open_email(attendee.email)
      expect(current_email).to have_content(webinar.title)
      expect(current_email).to have_content(l(webinar.live_date, format: :long))
    end
  end

end
