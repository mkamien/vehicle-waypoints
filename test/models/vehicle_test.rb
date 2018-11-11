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

end
