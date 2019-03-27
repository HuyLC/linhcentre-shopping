class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :user, foreign_key: true
      t.datetime :order_date
      t.integer :ship_fee 

      t.timestamps
    end
  end
end
