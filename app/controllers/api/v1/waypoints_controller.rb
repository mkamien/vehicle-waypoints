
module Api
  module V1
    class WaypointsController < ApplicationController

      def create_waypoint
        WaypointWorker.perform_async(waypoint_params.to_h)
        render :json => waypoint_params
      end

    private
      def waypoint_params
        params.permit(:latitude, :longitude, :vehicle_identifier, :sent_at)
      end
    end
  end
end
