require 'test_helper'

class VehicleTest < ActiveSupport::TestCase

  test "should not create a vehicle without identifier" do
    vehicle = Vehicle.new
    assert_not vehicle.save
  end

  test "should create a vehicle with identifier" do
    vehicle = Vehicle.new identifier:"AB-2131"
    assert vehicle.save
  end

  test "should not create two vehicles with the same identifier" do
    firstVehicle = Vehicle.new identifier:"AB-2131"
    secondVehicle = Vehicle.new identifier:"AB-2131"
    assert firstVehicle.save
    assert_not secondVehicle.save
  end

  test "should create two vehicles with different identifiers" do
    firstVehicle = Vehicle.new identifier:"AB-2131"
    secondVehicle = Vehicle.new identifier:"AC-1231"
    assert firstVehicle.save
    assert secondVehicle.save
  end

  test "get_last_waypoint method should return last waypoint" do
    vehicle = Vehicle.new identifier:"AB-2131"
    firstWaypoint = Waypoint.create! vehicle:vehicle, sent_at:Time.zone.parse( "2017-12-25 20:45:00" ), latitude:-45.00, longitude:30.00
    secondWaypoint = Waypoint.create! vehicle:vehicle, sent_at:Time.zone.parse( "2015-12-25 20:45:00" ), latitude:-45.00, longitude:32.00
    assert vehicle.get_last_waypoint == firstWaypoint
  end

end
