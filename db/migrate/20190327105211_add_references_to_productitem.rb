class AddReferencesToProductitem < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_items, :goods_receipt, index: true
  end
end
