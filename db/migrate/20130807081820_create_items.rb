class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :shelf_id
      t.string :medium
      t.string :medium_desc
      t.string :medium_icon    
      t.text :title
      t.string :creator
      t.string :url
      t.string :image_url

      t.timestamps
    end
  end
end
