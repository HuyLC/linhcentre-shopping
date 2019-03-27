class ChangeAmountAtProduct < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :amount, :quantity
  end
end
