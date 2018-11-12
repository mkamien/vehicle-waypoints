
module Api
  module V1
    class WaypointsController < ApplicationController

      def create_waypoint
        result = CreateWaypoint.call(waypoint_params)
        render json: result.waypoint
      end

    private
      def waypoint_params
        params.permit(:latitude, :longitude, :vehicle_identifier, :sent_at)
      end
    end
  end
end
