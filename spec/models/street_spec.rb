require 'spec_helper'
describe Street do 
  context "valid" do
    it "should be valid" do 
      FactoryGirl.create(:street).should be_valid
    end

    it "should require title" do 
      hotel = FactoryGirl.build(:street, title:'')
      expect(hotel).to have(1).errors_on(:title)
    end

    it "shoul require city" do 
      hotel = FactoryGirl.build(:street, city: nil)
      expect(hotel).to have(1).errors_on(:city)  
    end
  end
end