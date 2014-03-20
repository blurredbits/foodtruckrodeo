class StaticController < ApplicationController


  def home
    trucks = FoodTruck.all
    @locations = Gmaps4rails.build_markers(trucks) do |truck, marker|
      marker.lat  truck.latitude
      marker.lng  truck.longitude
      marker.infowindow truck.name
      marker.picture ({
        url:  "/assets/food_truck.png",
        width:  49,
        height: 32
      })
    end
  end

  def about; end
end
