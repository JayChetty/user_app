# == Schema Information
#
# Table name: reads
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  isbn       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author     :string(255)
#  title      :string(255)
#  comment    :string(255)
#  image_url  :string(255)
#

class Read < ActiveRecord::Base

  attr_accessible :isbn, :author, :title, :comment, :image_url

  belongs_to :user

  # def ititle
  #   book = GoogleBooks.search("isbn:#{self.isbn}").first
  #   book.title
  # end

  # def iauthor
  #   book = GoogleBooks.search("isbn:#{self.isbn}").first
  #   book.authors
  # end

  # def iimage
  #   book = GoogleBooks.search("isbn:#{self.isbn}").first
  #   book.image_link(:zoom => 5) 
  # end
end
