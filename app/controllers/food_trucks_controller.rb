class FoodTrucksController < ApplicationController
  before_action :set_food_truck, only: [:show, :edit, :update, :destroy]

  # GET /food_trucks
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

  end

  # GET /food_trucks/1
  def show
  end

  # GET /food_trucks/new
  def new
    @food_truck = FoodTruck.new
  end

  # GET /food_trucks/1/edit
  def edit
  end

  # POST /food_trucks
  def create
    @food_truck = FoodTruck.new(food_truck_params)

      if @food_truck.save
        format.html { redirect_to @food_truck, notice: 'Food truck was successfully created.' }
      else
        format.html { render action: 'new' }
      end
  end

  # PATCH/PUT /food_trucks/1
  # PATCH/PUT /food_trucks/1.json
  def update
      if @food_truck.update(food_truck_params)
        format.html { redirect_to @food_truck, notice: 'Food truck was successfully updated.' }
      else
        format.html { render action: 'edit' }
    end
  end

  # DELETE /food_trucks/1
  # DELETE /food_trucks/1.json
  def destroy
    @food_truck.destroy
      format.html { redirect_to food_trucks_url }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_truck
      @food_truck = FoodTruck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_truck_params
      params.require(:food_truck).permit(:latitude, :longitude, :address, :name)
    end
end
