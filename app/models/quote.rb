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
end
