  def change
    create_table :memes do |t|
      t.integer :user_id
      t.integer :current_quote_id

      t.timestamps
    end
  end