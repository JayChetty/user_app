# == Schema Information
#
# Table name: feelings
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  content       :text
#  feelable_id   :integer
#  feelable_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Feeling < ActiveRecord::Base
  attr_accessible :content, :feelable_id, :feelable_type
  belongs_to :feelable, polymorphic: true
  belongs_to :user
end
