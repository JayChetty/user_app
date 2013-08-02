class CreateFeelings < ActiveRecord::Migration
  def change
    create_table :feelings do |t|
      t.integer :user_id
      t.text :content
      t.integer :feelable_id
      t.string :feelable_type

      t.timestamps
    end
    add_index :feelings, [:feelable_id, :feelable_type]   
  end
end
