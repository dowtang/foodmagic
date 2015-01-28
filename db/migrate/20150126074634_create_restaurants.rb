class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :cuisinetype
      t.string :location
      t.string :logourl
      t.string :deliverytime
      t.string :deliverycost
      t.string :minimumorder
      t.string :paymenttype
      t.string :reviewcount
      t.string :menuurl
      t.timestamps
    end
  end
end
