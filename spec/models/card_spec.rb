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

require 'spec_helper'

describe Card do
  before do
  	@sender = User.create(name:"Jay Chetty", email: "user@example.com", password: "foobarbar", password_confirmation: "foobarbar")
  	@receiver = User.create(name:"Gill Chetty", email: "user2@example.com", password: "foobarbar", password_confirmation: "foobarbar")
  	@shelf = @sender.shelves.create(name: "Dystopia")
    @item =  @shelf.reads.create(isbn: "9781907832567")
    @card = @sender.sent_cards.create(receiver_id: @receiver.id, item_type: @item.class, item_id: @item.id, message: "Check this out" )
  end

  subject{@card}

  it {should be_valid}
  it {should respond_to(:receiver_id)}
  it {should respond_to(:sender_id)}
  it {should respond_to(:item_type)}
  it {should respond_to(:item_id)}
  it {should respond_to(:message)}
  it {should respond_to(:receiver)}
  it {should respond_to(:sender)}

  it {should respond_to(:item)}

  its (:item) {should == @item}

end
