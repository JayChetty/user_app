class RemoveItemTypeFromCards < ActiveRecord::Migration
  def change
	remove_column :cards, :item_type
  end
end
