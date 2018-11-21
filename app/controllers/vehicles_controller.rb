class VehiclesController < ApplicationController

  def show
    @waypoints = Vehicle.get_last_waypoints
  end

end
