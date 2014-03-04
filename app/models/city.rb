class City < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :state
  belongs_to :state
  has_many   :states
end
