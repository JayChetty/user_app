class Track < ActiveRecord::Base
  attr_accessible :artist, :image_url, :title, :url

  belongs_to :shelf
  has_many :feelings, as: :feelable
end
