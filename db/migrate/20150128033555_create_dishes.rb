class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :restaurant_id
      t.string :dish_category
      t.string :dish_name
      t.string :dish_size
      t.string :dish_price
      t.timestamps
    end
  end
end
