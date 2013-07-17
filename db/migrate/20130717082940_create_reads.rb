class CreateReads < ActiveRecord::Migration
  def change
    create_table :reads do |t|
      t.integer :user_id
      t.string :isbn

      t.timestamps
    end
    add_index :reads, :user_id
    add_index :reads, :isbn
  end
end
