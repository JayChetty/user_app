class Feeling < ActiveRecord::Base
  attr_accessible :content, :feelable_id, :feelable_type
  belongs_to :feelable, polymorphic: true
  belongs_to :user
end
