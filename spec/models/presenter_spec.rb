require 'rails_helper'

describe Presenter do
  it 'has a valid factory' do
    expect(build(:presenter)).to be_valid
  end

 let(:presenter) { build(:presenter) }

  describe "ActiveModel validations" do
    it "should validate the presence of data" do
      should validate_presence_of(:name)
      should validate_presence_of(:email)
      should validate_presence_of(:bio)
    end
  
    it "should validate format of data" do
      should allow_value("dhh@nonopinionated.com").for(:email) 
      should_not allow_value("blah").for(:email)
    end
  end
end
