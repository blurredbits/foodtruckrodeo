class OverviewMapController < ApplicationController

  RANGE = 50 #miles

  def index
  #  if user_location?
  #    @food_trucks = FoodTruck.near([user_latitude, user_longitude], RANGE)
  #  else
      @food_trucks = FoodTruck.where("latitude is not null").where("longitude is not null")
 #   end

    @locations = truck_location_places

   #   @locations << user_location_place if user_location?
  end

  private

  def user_location?
    cookies[:lat_lng] && cookies[:lat_lng].split("|").length == 2
  end

  def user_latitude
    cookie = cookies[:lat_lng].split("|")
    cookie[0]
  end

  def user_longitude
    cookie = cookies[:lat_lng].split("|")
    cookie[1]
  end

  def truck_location_places
    Gmaps4rails.build_markers(@food_trucks) do |truck, marker|
      marker.lat  truck.latitude
      marker.lng  truck.longitude
      marker.infowindow render_to_string(partial: "/food_trucks/infowindow", locals: { truck: truck} )
     # marker.picture ({
     #     url:  "food_truck.png",
     #     width:  49,
     #     height: 32
     # })
    end
  end

  def user_location_place
    Gmaps4rails.build_markers([cookies[:lat_lng].split("|")]) { |start, marker|
      marker.lat start[0]
      marker.lng start[1]
      marker.infowindow 'Start'
    }.first
  end

end
