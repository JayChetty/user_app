class ChangeStringToTextQuotes < ActiveRecord::Migration
  def up
  	change_column :quotes, :body, :text
  end

  def down
  	change_column :quotes, :body, :string
  end
end
