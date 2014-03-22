class OverviewMapController < ApplicationController

  def index
    @food_trucks = FoodTruck.all

    @locations = Gmaps4rails.build_markers(@food_trucks) do |truck, marker|
      marker.lat  truck.latitude
      marker.lng  truck.longitude
      marker.infowindow truck.name
      marker.picture ({
          url:  "/assets/food_truck.png",
          width:  49,
          height: 32
      })
    end

    # @lat_lng = cookies[:lat_lng].split("|") if cookies[:lat_lng]
    if cookies[:lat_lng]&& cookies[:lat_lng].split("|").length == 2
      @locations << Gmaps4rails.build_markers([cookies[:lat_lng].split("|")]) { |start, marker|
        marker.lat start[0]
        marker.lng start[1]
        marker.infowindow 'Start'
      }.first
    end

  end

end
