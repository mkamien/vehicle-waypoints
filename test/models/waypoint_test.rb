require 'test_helper'

class WaypointTest < ActiveSupport::TestCase

  test "should not create a waypoint that does not belong to a vehicle" do
    waypoint = Waypoint.new
    assert_not waypoint.save
  end

  test "should create a waypoint that belongs to a vehicle" do
    vehicle = Vehicle.new identifier:"AB-1212"
    waypoint = Waypoint.new vehicle:vehicle
    assert waypoint.save
  end

  test "could create two waypoints of the same vehicle" do
    vehicle = Vehicle.create! identifier:"AB-1212"
    firstWaypoint = Waypoint.create! vehicle:vehicle
    secondWaypoint = Waypoint.create! vehicle:vehicle
    assert (vehicle.waypoints.size == 2)
  end

end
