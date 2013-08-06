# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  shelf_id   :integer
#  title      :string(255)
#  artist     :string(255)
#  url        :string(255)
#  image_url  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  attr_accessible :artist, :image_url, :title, :url

  belongs_to :shelf
  has_many :feelings, as: :feelable
end
