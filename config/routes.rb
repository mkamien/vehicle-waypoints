Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post "/gps", to: "waypoints#create_waypoint"
    end
  end

  get "/show", to: "vehicles#index"
  
end
