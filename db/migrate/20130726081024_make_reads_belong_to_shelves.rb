class MakeReadsBelongToShelves < ActiveRecord::Migration
  def change
  	 rename_column :reads, :user_id, :shelf_id
  end
end
