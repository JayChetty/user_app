# == Schema Information
#
# Table name: cards
#
#  id          :integer          not null, primary key
#  sender_id   :integer
#  receiver_id :integer
#  item_type   :string(255)
#  item_id     :integer
#  message     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Card < ActiveRecord::Base
  attr_accessible :message, :item_id, :item_type, :receiver_id, :sender_id
 
  belongs_to :sender, class_name:"User"
  belongs_to :receiver, class_name: "User"

  validates :sender_id, presence: true
  validates :receiver_id, presence: true

  def item
    if self.item_type
  	  item = self.item_type.find(self.item_id)
    end
    item
  end
end
