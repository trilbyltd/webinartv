require 'rails_helper'

RSpec.describe WebinarRegistrationJob, type: :job do
  let(:attendee) { create(:attendee) }
  let(:webinar) { create(:webinar, :live) }
  
  it 'enqueues a job' do
    ActiveJob::Base.queue_adapter = :test
    expect {
      WebinarRegistrationJob.perform_later(attendee, webinar)
      }.to have_enqueued_job.on_queue('mailer')
    expect {
      WebinarRegistrationJob.perform_later(attendee, webinar)
    }.to have_enqueued_job(WebinarRegistrationJob)
  end
end
