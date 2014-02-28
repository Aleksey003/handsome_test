require 'spec_helper'

describe Comment do 
    context 'valid' do
        it 'should require rating' do 
            comment = Comment.new(user_id:1)
            expect(comment).to have(1).errors_on(:rating)
        end
        it 'should require user' do
            comment = Comment.new(rating: 2)
             expect(comment).to have(1).errors_on(:user)
        end
        it 'rating should be in scope 1...5' do 
            comment = Comment.new(rating: 6, user_id: 1)
            expect(comment).to have(1).errors_on(:rating)
        end
    end
end