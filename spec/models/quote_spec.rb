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
    #@meme = @user.memes.create
    @quote = @user.quotes.create(author:"Walt Whitman", body:"lala")
  end

  subject {@quote}
  it {should respond_to(:user_id)}
  it {should respond_to(:user)}
  it {should respond_to(:author)}
  it {should respond_to(:body)}
  it {should respond_to(:to_string)}


  its (:user) {should == @user}
  #its (:id) {should == @user.current_quote_id}

  it {should be_valid}

  describe "accessible attributes" do
  	it "should not allow access to user_id" do
  		expect do
  			Quote.new(user_id: @user.id)
  		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end

    # it "should not allow removal when current" do
    #     @quote.destroy
    #     @quote.errors.should include(:id)
    # end    
  end

  describe "when user_id is not present" do
  	before { @quote.user_id = nil }
  	it { should_not be_valid }
  end	

end
