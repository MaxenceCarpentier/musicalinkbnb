class CreateProfs < ActiveRecord::Migration
  def change
    create_table :profs do |t|
      t.string :instrument
      t.string :experience
      t.string :style
      t.string :influence
      t.string :lesson_type
      t.string :description
      t.string :listing_name
      t.string :address
      t.integer :price
      t.boolean :active
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
