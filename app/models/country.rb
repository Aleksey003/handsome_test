class Country < ActiveRecord::Base
    validates_presence_of :title
    has_many :states
end
