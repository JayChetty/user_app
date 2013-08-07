# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  current_quote_id       :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
    

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body

  
  has_many :quotes, dependent: :destroy
  has_many :shelves, dependent: :destroy
  has_many :feelings, dependent: :destroy

  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id", dependent: :destroy
  
  has_many :friends, through: :friendships, conditions: "friendships.status = 'confirmed'"

  has_many :sent_cards, foreign_key: "sender_id", class_name: "Card"
  has_many :received_cards, foreign_key: "receiver_id", class_name: "Card", dependent: :destroy

  belongs_to :current_quote, class_name: "Quote"

  validates :name,  presence: true

  # after_create do 
  #   self.memes.create     
  # end


  def request_friend(friend)
    self.friendships.create(friend_id: friend.id, status: "requested")
    friend.friendships.create(friend_id: self.id, status: "pending")
  end

  def confirm_friend(friend)
    pend = self.friendships.find(:all, conditions: ['friend_id = ? AND status = "pending"', friend.id]).first
    if pend
      pend.status = "confirmed"
      request = friend.friendships.find(:all, conditions: ['friend_id = ? AND status = "requested"', self.id]).first
      request.status = "confirmed"
      pend.save
      request.save
    end
  end 



end
