class ChangeSentAtToBeDatetimeInWaypoints < ActiveRecord::Migration[5.2]
  def change
    change_column :waypoints, :sent_at, :datetime
  end
end
