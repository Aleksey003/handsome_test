class CreateStreets < ActiveRecord::Migration
  def change
    create_table :streets do |t|
      t.string :title
      t.references :city, index: true

      t.timestamps
    end
  end
end
