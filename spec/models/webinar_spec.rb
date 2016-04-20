require 'rails_helper'

describe Webinar do  
  it { should belong_to(:presenter) }
  
  it 'has a valid factory' do
    expect(build(:webinar)).to be_valid
    expect(build(:webinar, :live)).to be_valid
  end

  describe "when draft" do
    it "is valid" do
      draft_webinar = create(:webinar)
      should validate_presence_of(:title)
      should validate_presence_of(:live_date)
    end
  end
  
  describe "when published" do
    it "is valid" do
      webinar = create(:webinar, :live)
      webinar.activate!
      expect(webinar.active).to be true
      should validate_presence_of(:description)
      should validate_presence_of(:presenter_id)
      should validate_presence_of(:webinar_url)
    end
  end
end
