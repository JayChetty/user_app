class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :item_type
      t.integer :item_id
      t.text :message

      t.timestamps
    end
    add_index :cards, :sender_id
    add_index :cards, :receiver_id
  end
end
