require "rails_helper"
include ActiveJob::TestHelper

RSpec.describe WebinarMailer, type: :mailer do
  let(:attendee) { create(:attendee) }
  let(:webinar) { create(:webinar, :live) }
  
  it 'enqueues a job' do
    ActiveJob::Base.queue_adapter = :test
    expect {
      WebinarMailer.webinar_registration(attendee, webinar).deliver_later
    }.to have_enqueued_job.on_queue('mailer')
  end

  it 'delivers an email' do
    expect { WebinarMailer.webinar_registration(attendee, webinar).deliver_now }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end

  describe 'instructions' do
    let(:mail) { WebinarMailer.webinar_registration(attendee, webinar) }

    it 'renders the subject' do
      expect(mail.subject).to have_text('Your Webinar Registration')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([attendee.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['noreply@webinars.trilbytv.co.uk'])
    end
  end

end
