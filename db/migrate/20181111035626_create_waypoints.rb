class CreateWaypoints < ActiveRecord::Migration[5.2]
  def change
    create_table :waypoints do |t|
      t.references :vehicle, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.time :sent_at

      t.timestamps
    end
  end
end
