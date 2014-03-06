class AddExtraAttributesToItems < ActiveRecord::Migration
  def change
    add_column :items, :extra_attributes, :string
  end
end
