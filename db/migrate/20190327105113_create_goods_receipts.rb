class CreateGoodsReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :goods_receipts do |t|
      t.datetime :receipt_date
      t.integer :total_price

      t.timestamps
    end
  end
end
