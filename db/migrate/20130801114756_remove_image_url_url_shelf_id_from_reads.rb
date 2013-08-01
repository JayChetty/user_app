class RemoveImageUrlUrlShelfIdFromReads < ActiveRecord::Migration
  def change
  	remove_column :reads, :current_quote_id
  end
end
