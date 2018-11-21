require 'test_helper'

class WaypointTest < ActiveSupport::TestCase

  test "should not create a waypoint that does not belong to a vehicle" do
    waypoint = Waypoint.new
    assert_not waypoint.save
  end

  test "should create a waypoint that belongs to a vehicle" do
    vehicle = Vehicle.new identifier:"AB-1212"
    waypoint = Waypoint.new vehicle:vehicle, latitude:-45.00, longitude:30.00
    assert waypoint.save
  end

  test "should not create a waypoint with lower than min latitude value" do
    vehicle = Vehicle.new identifier:"AB-1212"
    waypoint = Waypoint.new vehicle:vehicle, longitude:30.00, latitude:-91.00
    assert_not waypoint.save
  end

  test "should not create a waypoint with higher than max latitude value" do
    vehicle = Vehicle.new identifier:"AB-1212"
    waypoint = Waypoint.new vehicle:vehicle, longitude:30.00, latitude:92.00
    assert_not waypoint.save
  end

  test "should not create a waypoint with lower than min longitude value" do
    vehicle = Vehicle.new identifier:"AB-1212"
    waypoint = Waypoint.new vehicle:vehicle, longitude:-181.00, latitude:-81.00
    assert_not waypoint.save
  end

  test "should not create a waypoint with higher than max longitude value" do
    vehicle = Vehicle.new identifier:"AB-1212"
    waypoint = Waypoint.new vehicle:vehicle, longitude:183.00, latitude:42.00
    assert_not waypoint.save
  end

  test "should create a waypoint with correct latitude and longitude values" do
    vehicle = Vehicle.new identifier:"AB-1212"
    waypoint = Waypoint.new vehicle:vehicle, longitude:78.00, latitude:42.00
    assert waypoint.save
  end

  test "could create two waypoints of the same vehicle" do
    vehicle = Vehicle.create! identifier:"AB-1212"
    firstWaypoint = Waypoint.create! vehicle:vehicle, latitude:-45.00, longitude:30.00
    secondWaypoint = Waypoint.create! vehicle:vehicle, latitude:-45.00, longitude:32.00
    assert (vehicle.waypoints.size == 2)
  end

end
