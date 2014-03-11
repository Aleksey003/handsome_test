require 'spec_helper'

describe Hotel do 
  context "valid" do
    it "should be valid" do 
      FactoryGirl.create(:hotel).should be_valid
    end

    it "should require title" do 
      hotel = FactoryGirl.build(:hotel, title:'')
      expect(hotel).to have(1).errors_on(:title)
    end
  end
  context "avg rating" do 
    it "avg rating should be 5" do
        hotel1 = FactoryGirl.create(:hotel)
        hotel2 = FactoryGirl.create(:hotel)        
        FactoryGirl.create(:comment, rating:2, hotel: hotel1)
        FactoryGirl.create(:comment, rating:3, hotel: hotel1)
        FactoryGirl.create(:comment, rating:2, hotel: hotel2)
        (expect(hotel1.avg_rating).to eq 2.5) &&  (expect(hotel2.avg_rating).to eq 2)
    end
  end
end
