class CreateWaypoint
  include Interactor

  def call
    vehicle = Vehicle.find_by_identifier( context.vehicle_identifier )
    latitude = context.latitude.to_f
    longitude = context.longitude.to_f
    sent_at = Time.zone.parse( context.sent_at )
    waypoint = Waypoint.create! latitude: latitude, longitude: longitude, vehicle: vehicle, sent_at: sent_at
  end

end
