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

require 'spec_helper'

describe Quote do
  before do
    @user = User.create(name:"Jay Chetty", email: "user@example.com", password: "foobarbar", password_confirmation: "foobarbar")
    @quote = @user.quotes.build(author: "Walt Whitman", body: "lalalllalalala")
  end

  subject {@quote}

  it {should respond_to(:author)}
  it {should respond_to(:body)}
  its (:user) {should == @user}
  

  it {should be_valid}

  describe "accessible attributes" do
  	it "should not allow access to user_id" do
  		expect do
  			Quote.new(user_id: @user.id)
  		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end
  end

  describe "when user_id is not present" do
  	before { @quote.user_id = nil }
  	it { should_not be_valid }
  end	

end
