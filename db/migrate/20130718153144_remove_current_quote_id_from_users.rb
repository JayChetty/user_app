class RemoveCurrentQuoteIdFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :current_quote_id
  end
end
