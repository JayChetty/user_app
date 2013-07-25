# == Schema Information
#
# Table name: quotes
#
#  id         :integer          not null, primary key
#  author     :string(255)
#  body       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Quote < ActiveRecord::Base
  attr_accessible :author, :body

  belongs_to :user

  validates :body, presence: true
  validates :user_id, presence: true

  def to_string
  	out = "\"#{self.body}\""
  	out << " - #{self.author}" if self.author and !self.author.empty?
  	out
  end

  # before_destroy do
  # 	if self.id == self.user.current_quote_id
  #     errors.add(:id)
  #     false
  #   end
  # end
end
