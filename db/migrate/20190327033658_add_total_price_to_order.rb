class AddTotalPriceToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :total_price, :integer
    add_column :orders, :discount_percent, :integer
    add_column :orders, :discount_price, :integer
  end
end
