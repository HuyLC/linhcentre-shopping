class ChangePriceAddProduct2 < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :wholesale_price, :integer
    change_column :products, :retail_price, :integer
  end
end
