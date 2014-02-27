class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.references :hotel, index: true
      t.integer :rating, default: 0
      t.text :comment_text

      t.timestamps
    end
  end
end
