class DropMemes < ActiveRecord::Migration
  def change
  	drop_table :memes
  end
end
