class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :hotel
  validates :rating, :inclusion => { :in => 1..5 }
  validates_presence_of :user

  after_commit :update_rating

  def update_rating
    hotel.update_rating
  end 
   
end
