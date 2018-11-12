class WaypointWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(params)
    CreateWaypoint.call(params)
  end
end
