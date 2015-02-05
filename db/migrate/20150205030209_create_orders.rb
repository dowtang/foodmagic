class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :mobile
      t.string :email
      t.string :comments
      t.string :order_status

      t.timestamps
    end
  end
end
