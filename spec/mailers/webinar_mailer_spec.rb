require "rails_helper"
include ActiveJob::TestHelper

RSpec.describe WebinarMailer, type: :mailer do
  let(:attendee) { create(:attendee) }
  let(:webinar) { create(:webinar, :live) }
  
  it 'enqueues a job when sent later' do
    expect {
      WebinarMailer.webinar_registration(attendee, webinar).deliver_later
    }.to have_enqueued_job.on_queue('mailers')
  end

  it 'deliveres emails' do
    WebinarMailer.webinar_registration(attendee, webinar).deliver_now
    WebinarMailer.internal_join_notification(attendee, webinar).deliver_now
    expect(ActionMailer::Base.deliveries.count).to eq 2
  end

  it 'queued job delivers 2 emails' do
    expect { 
      perform_enqueued_jobs do
        WebinarMailer.webinar_registration(attendee, webinar).deliver_later
        WebinarMailer.internal_join_notification(attendee, webinar).deliver_later
        end
      }.to change { ActionMailer::Base.deliveries.count }.by(2)
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
    
    it '3 contains attachments' do
      expect(mail.attachments.count).to eq(3)
    end
  end

end
