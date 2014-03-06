class AddProperAttributesToItems < ActiveRecord::Migration
  def change
    add_column :items, :blurb, :text
    add_column :items, :large_image_url, :string
    add_column :items, :alt_image_url, :string
  end
end
