class DropReadsTracksTidy < ActiveRecord::Migration
  def change
  	drop_table :reads
  	drop_table :tracks

  	remove_column :feelings, :content
  	remove_column :shelves, :comment
  end
end
