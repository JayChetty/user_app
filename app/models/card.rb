# == Schema Information
#
# Table name: cards
#
#  id          :integer          not null, primary key
#  sender_id   :integer
#  receiver_id :integer
#  item_id     :integer
#  message     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Card < ActiveRecord::Base
	validate :check_friends
  attr_accessible :message, :item_id, :receiver_id, :sender_id
 
  belongs_to :sender, class_name:"User"
  belongs_to :receiver, class_name: "User"

  validates :sender_id, presence: true
  validates :receiver_id, presence: true

  belongs_to :item

  private
	  def check_friends
	  	sender = User.find(sender_id)
	  	errors.add(:receiver_id) unless sender.friends.exists?(receiver_id)
	  end

end
