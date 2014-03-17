require 'spec_helper'
describe Country do 
  context "valid" do
    it "should be valid" do 
      FactoryGirl.create(:country).should be_valid
    end

    it "should require title" do 
      hotel = FactoryGirl.build(:country, title:'')
      expect(hotel).to have(1).errors_on(:title)
    end
  end
end