class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :shelf_id
      t.string :image_url
      t.string :url

      t.timestamps
    end
     add_index :items, [:shelf_id]
  end
end
