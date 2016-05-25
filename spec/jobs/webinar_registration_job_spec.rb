require 'rails_helper'

RSpec.describe WebinarRegistrationJob, type: :job do
  let(:attendee) { create(:attendee) }
  let(:webinar) { create(:webinar, :live) }
  
  it 'enqueues a job' do
    expect {
      WebinarRegistrationJob.perform_later(attendee, webinar)
      }.to have_enqueued_job.on_queue('mailers')
    expect {
      WebinarRegistrationJob.perform_later(attendee, webinar)
    }.to have_enqueued_job(WebinarRegistrationJob)
  end
end
