class Hotel < ActiveRecord::Base
	has_many :comments
	validates_presence_of :title
	
    def update_rating
    comments_count = comments.count
      if comments_count == 0
        avg_rating = 0 
      else
        avg_rating = comments.map(&:rating).inject(0, &:+).to_f / comments_count
      end
    self.update_attributes(avg_rating: avg_rating)
  end
end
