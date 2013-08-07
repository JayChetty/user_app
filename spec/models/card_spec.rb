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

require 'spec_helper'

describe Card do
  before do
  	@sender = User.new(name:"Jay Chetty", email: "user@example.com", password: "foobarbar", password_confirmation: "foobarbar")
  	@receiver = User.new(name:"Gill Chetty", email: "user2@example.com", password: "foobarbar", password_confirmation: "foobarbar")
    User.update_all(:confirmed_at => Time.now)
    @sender.save
    @receiver.save
  	@shelf = @sender.shelves.create(name: "Dystopia")
    @item =  @shelf.items.create(medium: "read")
    @card = @sender.sent_cards.create(receiver_id: @receiver.id, item_id: @item.id, message: "Check this out" )
  end

  subject{@card}

  it {should be_valid}
  it {should respond_to(:receiver_id)}
  it {should respond_to(:sender_id)}
  it {should respond_to(:item_id)}
  it {should respond_to(:message)}
  it {should respond_to(:receiver)}
  it {should respond_to(:sender)}

  it {should respond_to(:item)}

  its (:item) {should == @item}

end
