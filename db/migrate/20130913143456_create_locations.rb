class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :sticker_code
      t.float :latitude
      t.float :longitude
      t.datetime :date
      t.string :options

      t.timestamps
    end
  end
end
