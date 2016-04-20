require "rails_helper"

describe WebinarAttendee do
  context "associations" do
    let(:attendee) { create(:attendee) }
    let(:webinar) { create(:webinar) }
    let(:webinar_attendee) { WebinarAttendee.create(webinar_id: webinar.id, attendee_id: attendee.id)}
        
    it "before attending, it should exist" do
      expect(webinar_attendee).to be_valid
      should validate_presence_of(:webinar_id)
      should validate_presence_of(:attendee_id)
    end
    
    it "after attending, attendence should be true" do
      # webinar_attendee(:update_attributes).with(attended: false)
      webinar_attendee.attended!
      expect(webinar_attendee).to be_valid
      expect(webinar_attendee.attended).to be true
    end 

  end
end
