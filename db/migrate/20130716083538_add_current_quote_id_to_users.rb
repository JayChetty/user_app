class AddCurrentQuoteIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_quote_id, :integer
  end
end
