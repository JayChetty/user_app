class AddAuthorTitleCommentImageUrlToReads < ActiveRecord::Migration
  def change
    add_column :reads, :author, :string
    add_column :reads, :title, :string
    add_column :reads, :comment, :string
    add_column :reads, :image_url, :string
  end
end
