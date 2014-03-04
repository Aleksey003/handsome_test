class State < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :country
  belongs_to :country
  has_many :cities
end
