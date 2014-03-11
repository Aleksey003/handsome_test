class Hotel < ActiveRecord::Base
	has_many :comments
  has_many :assets
  belongs_to :country
  belongs_to :state
  belongs_to :city
  belongs_to :street

	validates_presence_of :title
  
  scope :top_rating, -> {order('avg_rating DESC')}
  scope :limit_top_rating,  ->(limit_count) {top_rating.limit(limit_count)}
  def update_rating
    comments_count = comments.count
      if comments_count == 0
        avg_rating = 0 
      else
        avg_rating = comments.sum(:rating).to_f / comments_count
      end
    self.update_attributes!(avg_rating: avg_rating)
  end
end
