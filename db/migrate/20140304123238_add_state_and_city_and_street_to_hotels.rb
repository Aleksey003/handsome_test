class AddStateAndCityAndStreetToHotels < ActiveRecord::Migration
  def change
    add_reference :hotels, :state, index: true
    add_reference :hotels, :city, index: true
    add_reference :hotels, :street, index: true
  end
end
