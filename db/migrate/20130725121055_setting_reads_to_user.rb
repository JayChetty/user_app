class SettingReadsToUser < ActiveRecord::Migration
  def change
  	rename_column :reads, :meme_id, :user_id
  end
end
