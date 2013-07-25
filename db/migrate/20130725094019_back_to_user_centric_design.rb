class BackToUserCentricDesign < ActiveRecord::Migration
  def change
  	remove_column :memes, :current_quote_id
  	add_column :users, :current_quote_id, :integer

  	rename_column :quotes, :meme_id, :user_id
  end
end
