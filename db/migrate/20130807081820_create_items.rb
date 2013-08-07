class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :shelf_id
      t.string :medium 
      t.text :title
      t.string :creator
      t.string :url
      t.string :image_url

      t.timestamps     
    end
    add_index :items, :shelf_id
  end
end
