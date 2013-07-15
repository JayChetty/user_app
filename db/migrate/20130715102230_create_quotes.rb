class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :author
      t.string :body

      t.timestamps
    end
    add_index :quotes, [:author]
  end
end
