require "rails_helper"

describe WebinarAttendee do
  context "associations" do
    let(:attendee) { create(:attendee) }
    let(:webinar) { create(:webinar, :live) }
    let(:webinar_attendee) { WebinarAttendee.create(webinar_id: webinar.id, attendee_id: attendee.id)}
        
    it "before attending, it should exist" do
      expect(webinar_attendee).to be_valid
      should validate_presence_of(:webinar_id)
      should validate_presence_of(:attendee_id)
    end
    
    it "after attending, attendence should be true" do
      webinar_attendee.update!(attended: true)
      expect(webinar_attendee).to be_valid
      expect(webinar_attendee.attended).to be true
    end 

    it "an attendee returns a collection of webinars" do
      webinar_attendee.update!(attended: true)
      expect(attendee.webinars.first).to eq(webinar)
    end

    it "a webinar returns a collection of attendees" do
      webinar_attendee.update!(attended: true)
      expect(webinar.attendees.first).to eq(attendee)
    end
    
  end
end
