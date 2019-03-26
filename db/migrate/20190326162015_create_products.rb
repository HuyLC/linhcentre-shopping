class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.decimal :wholesale_price
      t.decimal :retail_price
      t.integer :amount

      t.timestamps
    end
  end
end
