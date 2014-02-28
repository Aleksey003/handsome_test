class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :hotel
  validates :rating, :inclusion => { :in => 1..5 }
  validates_presence_of :user

  after_save :update_rating

  def update_rating
    self.hotel.update_rating
  end 
   
end
