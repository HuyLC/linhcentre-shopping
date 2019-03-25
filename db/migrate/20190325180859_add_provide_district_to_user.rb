class AddProvideDistrictToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ward, :string
    add_column :users, :district, :string
    add_column :users, :provide, :string

  end
end
