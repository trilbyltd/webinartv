require 'rails_helper'

describe Webinar do  
  let(:webinar) { build(:webinar) }
  it { should belong_to(:presenter) }
  
  it 'has a valid factory' do
    expect(build(:webinar)).to be_valid
    expect(build(:webinar, :live)).to be_valid
  end

  describe "when draft" do
    it "is valid" do
      draft_webinar = create(:webinar)
      should validate_presence_of(:title).with_message("Please provide a title")
      should validate_presence_of(:live_date)
    end
    context "with a date in the past" do
      let(:webinar) { build(:webinar, :past) }
      it "is invalid" do
        expect(webinar).to be_invalid
        # TODO: should_not be_valid.with_message("You can't schedule a webinar in the past")
      end
    end
   end
  
  describe "when published" do
    it "is valid" do
      webinar = create(:webinar, :live)
      webinar.activate!
      expect(webinar.active).to be true
      # should validate_presence_of(:description)
      expect(webinar).to be_valid
      # should validate_presence_of(:presenter_id)
      # should validate_presence_of(:webinar_url)
    end
  end
end
