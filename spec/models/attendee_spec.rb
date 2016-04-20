require 'rails_helper'

describe Attendee do
  it 'has a valid factory' do
    expect(build(:attendee)).to be_valid
  end

  let(:attendee) { build(:attendee) }

  describe "ActiveModel validations" do
    it "should validate the presence of data" do
      should validate_presence_of(:name).with_message('Please provide your name')
      should validate_presence_of(:email).with_message('Please supply your email address so we can send you the webinar information.')
      should validate_presence_of(:school_name)#.with_message("Please let us know where you're from.")
    end
  
    it "should validate format of data" do
      should allow_value("dhh@nonopinionated.com").for(:email) 
      should_not allow_value("blah").for(:email).with_message("That email doesn't appear to be valid")
    end

  end
end
