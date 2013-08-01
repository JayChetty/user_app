class Item < ActiveRecord::Base
  attr_accessible :image_url, :url

  belongs_to :shelf
  has_one :read
end
