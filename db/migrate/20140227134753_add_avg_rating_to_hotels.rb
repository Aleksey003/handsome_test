class AddAvgRatingToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :avg_rating, :float, default: 0
  end
end
