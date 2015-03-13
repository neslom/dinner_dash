class AddPrecisionToItemPrice < ActiveRecord::Migration
  def change
    remove_column :items, :price
    add_column :items, :price, :float, precision: 2
  end
end
