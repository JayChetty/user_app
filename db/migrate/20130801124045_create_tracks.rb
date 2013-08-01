class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :shelf_id
      t.string :title
      t.string :artist
      t.string :url
      t.string :image_url

      t.timestamps
    end

    add_index :tracks, [:shelf_id]
  end
end
