class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :restaurant_id
      t.string :category
      t.string :name
      t.timestamps
    end
  end
end
