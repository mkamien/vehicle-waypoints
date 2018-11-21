class Vehicle < ApplicationRecord
  validates :identifier, presence: true, uniqueness: true
  has_many :waypoints

  def get_last_waypoint
    self.waypoints.order(sent_at: :desc).first
  end

  def self.get_last_waypoints
    waypoints = []
    Vehicle.all.each do |vehicle|
      waypoints << vehicle.get_last_waypoint
    end
    waypoints
  end

end
