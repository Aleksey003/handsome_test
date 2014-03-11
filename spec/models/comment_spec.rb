require 'spec_helper'

describe Comment do 
    context 'valid' do
        it 'should be valid' do 
            FactoryGirl.create(:comment).should be_valid
        end
        it 'should require rating' do 
            comment = FactoryGirl.build(:comment, rating: nil)
            expect(comment).to have(1).errors_on(:rating)
        end
        it 'should require user' do
            comment = Comment.new(rating: 2)
             expect(comment).to have(1).errors_on(:user)
        end
        it 'rating should be in scope 1...5' do 
            comment = FactoryGirl.build(:comment,rating: 6)
            expect(comment).to have(1).errors_on(:rating)
        end
    end
end