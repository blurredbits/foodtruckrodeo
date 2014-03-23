class AddUrlToFoodTruck < ActiveRecord::Migration
  def change
    add_column(:food_trucks, :url, :string, null: true)
  end
end
