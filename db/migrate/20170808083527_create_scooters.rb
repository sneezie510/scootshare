class CreateScooters < ActiveRecord::Migration[5.0]
  def change
    create_table :scooters do |t|
      t.string :make
      t.string :model
      t.string :location
      t.boolean :availability
      t.string :picture
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
