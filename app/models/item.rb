# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  shelf_id   :integer
#  medium     :string(255)
#  title      :text
#  creator    :string(255)
#  url        :string(255)
#  image_url  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ActiveRecord::Base

  MEDIUM_DESC = {"read" => "Author", "track" => "Artist", "show" => "Actors"} 
  MEDIUM_ICON = {"read" => '<i class="icon-book"></i>', "track" => '<i class="icon-music"></i>', "show" => '<i class="icon-film"></i>'}  

  attr_accessible :creator, :image_url, :medium, :title, :url

  belongs_to :shelf
  has_many :feelings, as: :feelable, dependent: :destroy
  has_many :cards, dependent: :destroy

  validates :medium,  presence: true

  # def before_create
  # 	if self.medium == "book"
  # 		self.medium_desc = "Author"
  # 		self.medium_icon = '<i class="icon-book"></i>'
  # 	elsif self.medium == "track"
  # 		self.medium_desc ="Artist"
  # 		self.medium_icon = '<i class="icon-music"></i>'
  # 	end
  # end



end
