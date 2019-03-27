class ChangeDefautAtPrice < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :ship_fee, :integer, default: 0
    change_column :orders, :total_price, :integer, default: 0
    change_column :orders, :discount_percent, :integer, default: 0
    change_column :orders, :discount_price, :integer, default: 0
    change_column :orders, :status, :integer, default: 0
    change_column :products, :quantity, :integer, default: 0
    change_column :products, :wholesale_price, :integer, default: 0
    change_column :products, :retail_price, :integer, default: 0
    change_column :order_items, :quantity, :integer, default: 1
    change_column :order_items, :total_price, :integer, default: 0
  end
end
