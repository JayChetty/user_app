class AddTitleToMemes < ActiveRecord::Migration
  def change
    add_column :memes, :title, :string
  end
end
