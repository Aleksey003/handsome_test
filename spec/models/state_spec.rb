require 'spec_helper'
describe State do 
  context "valid" do
    it "should be valid" do 
      FactoryGirl.create(:state).should be_valid
    end

    it "should require title" do 
      hotel = FactoryGirl.build(:state, title:'')
      expect(hotel).to have(1).errors_on(:title)
    end
    it "should require country" do 
      hotel = FactoryGirl.build(:state, country: nil)
      expect(hotel).to have(1).errors_on(:country)
    end

  end
end