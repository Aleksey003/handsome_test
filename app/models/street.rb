class Street < ActiveRecord::Base
  belongs_to :city
  validates_presence_of :title
  validates_presence_of :city
end
