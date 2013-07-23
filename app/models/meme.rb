# == Schema Information
#
# Table name: memes
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  current_quote_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Meme < ActiveRecord::Base
  attr_accessible :current_quote_id

  has_many  :quotes
  has_many  :reads
  belongs_to :user
  belongs_to :current_quote, class_name: "Quote"

  validates :user_id, presence: true

  # def make_current(quote)
  #   if self.quotes.size == 1 
  #     self.current_quote_id = quote.id
  #     self.save
  #   end
  # end

  after_create do 
    default_quote = self.quotes.create(body: "Default quote. Add real") 
    self.current_quote_id = default_quote.id    
    self.save
  end 





end
