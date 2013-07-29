# == Schema Information
#
# Table name: reads
#
#  id         :integer          not null, primary key
#  shelf_id   :integer
#  isbn       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author     :string(255)
#  title      :string(255)
#  comment    :string(255)
#  image_url  :string(255)
#

class Read < ActiveRecord::Base

  attr_accessible :isbn, :author, :title, :comment, :image_url, :url

  belongs_to :shelf

end
