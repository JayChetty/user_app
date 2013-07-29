class AddUrlToReads < ActiveRecord::Migration
  def change
    add_column :reads, :url, :string
  end
end
