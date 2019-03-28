class AddShipMethodToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :ship_method, :integer, default: 0
  end
end
