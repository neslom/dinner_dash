class AddScaleToItemPrice < ActiveRecord::Migration
  def change
    remove_column :items, :price
    add_column :items, :price, :float, scale: 2
  end
end
