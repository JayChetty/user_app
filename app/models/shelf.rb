# == Schema Information
#
# Table name: shelves
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment    :string(255)
#

class Shelf < ActiveRecord::Base
  attr_accessible :name, :user_id, :comment

  belongs_to :user
  has_many :items, dependent: :destroy

  # def icon 
  # 	iconstring = ""
  # 	if self.reads.any?
  #   iconstring << "<i class=\"icon-book\"></i>"
  #     if self.tracks.empty?
  #     	iconstring << "<i class=\"icon-empty\"></i>"
  #     end
	 #  end

	 #  if self.tracks.any?
  #   iconstring << "<i class=\"icon-music\"></i>"
  #     if self.reads.empty?
  #     	iconstring << "<i class=\"icon-empty\"></i>"
  #     end
  #   end
  #   iconstring
  # end

  def icon 
    iconstring = ""
    iconstring << "<i class=\"icon-book\"></i>" if self.items.find(:all, conditions: ["medium = 'read'"]).any?
    iconstring << "<i class=\"icon-music\"></i>" if self.items.find(:all, conditions: ["medium = 'track'"]).any?
    iconstring << "<i class=\"icon-film\"></i>" if self.items.find(:all, conditions: ["medium = 'show'"]).any?

    iconstring

  end  
end
