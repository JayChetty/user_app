class MakeMemeParentRead < ActiveRecord::Migration
  def change
  	 rename_column :reads, :user_id, :meme_id
  end
end
