class AddCommentToShelves < ActiveRecord::Migration
  def change
    add_column :shelves, :comment, :string
  end
end
