class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :title
      t.text :room_description
      t.float :price_for_room
      t.boolean :breakfast_included

      t.timestamps
    end
  end
end
