require 'spec_helper'

describe Hotel do 
  context "valid" do
    it "should require title" do 
      hotel = Hotel.create(room_description: 'description1')
      expect(hotel).to have(1).errors_on(:title)
    end
  end
  context "avg rating" do 
    it "avg rating should be 5" do
        hotel1 = Hotel.create!(title: 'hotel 1', room_description: 'room_description')
        hotel2 = Hotel.create!(title: 'hotel 2', room_description: 'room_description')
        user = User.create!(email:'user@user.com', password: 12345678)
        hotel1.comments.create!(user: user, rating:3, comment_text: 'comment 1')
        hotel1.comments.create!(user: user, rating:2, comment_text: 'comment 2')
        hotel2.comments.create!(user: user, rating:2, comment_text: 'comment 2')
        hotel1.update_rating
        hotel2.update_rating
        (expect(hotel1.avg_rating).to eq 2.5) &&  (expect(hotel2.avg_rating).to eq 2)
    end
  end
end
