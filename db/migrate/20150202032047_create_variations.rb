class CreateVariations < ActiveRecord::Migration
  def change
    create_table :variations do |t|
      t.string :price
      t.string :size
      t.string :dish_id
      t.timestamps
    end
  end
end
