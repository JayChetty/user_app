class AddUserIndexToFeelings < ActiveRecord::Migration
  def change
  	add_index :feelings, :user_id
  end
end
