class AddPhotoToScooter < ActiveRecord::Migration[5.0]
  def change
    add_column :scooters, :photo, :string
  end
end
