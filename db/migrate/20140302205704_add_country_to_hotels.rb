class AddCountryToHotels < ActiveRecord::Migration
  def change
    add_reference :hotels, :country, index: true
  end
end
