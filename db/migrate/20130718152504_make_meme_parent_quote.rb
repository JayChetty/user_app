class MakeMemeParentQuote < ActiveRecord::Migration
  def change
  	 rename_column :quotes, :user_id, :meme_id
  end
end
