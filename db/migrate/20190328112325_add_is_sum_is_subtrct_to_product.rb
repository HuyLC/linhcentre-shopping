class AddIsSumIsSubtrctToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :product_items, :is_sum, :boolean, default: false
    add_column :order_items, :is_sum, :boolean, default: false
    add_column :order_items, :is_substract, :boolean, default: false
  end
end
