require 'spec_helper'
describe City do 
  context "valid" do
    it "should be valid" do 
      FactoryGirl.create(:city).should be_valid
    end

    it "should require title" do 
      hotel = FactoryGirl.build(:city, title:'')
      expect(hotel).to have(1).errors_on(:title)
    end
    it "should require state" do
      hotel = FactoryGirl.build(:city, state: nil)
      expect(hotel).to have(1).errors_on(:state)  
    end
  end
end