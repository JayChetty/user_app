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

require 'spec_helper'


describe Meme do
  before do
    @user = User.create(name:"Jay Chetty", email: "user@example.com", password: "foobarbar", password_confirmation: "foobarbar")
    @meme = @user.memes.create
  end

  subject {@meme}

  it {should respond_to(:quotes)}
  it {should respond_to(:current_quote)}

  it {should respond_to(:title)}  
  it {should respond_to(:reads)}
  its (:user) {should == @user}
  it {should be_valid}

  it "should have a title" do
     @meme.title.should == "New Meme"
  end

  it "should have a default quote" do
     @meme.quotes.size.should == 1
  end

  it "should be the current quote" do
     @meme.current_quote should be_valid
  end  

  describe "accessible attributes" do
  	it "should not allow access to user_id" do
  		expect do
  			Quote.new(user_id: @user.id)
  		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end
  end

  describe "when user_id is not present" do
  	before { @meme.user_id = nil }
  	it { should_not be_valid }
  end	

  # describe "New quote added" do
  #   before do      
  #     @meme.save
  #     @quote = @meme.quotes.create(author: "Walt Whitman", body: "lalalllalalala")   
  #   end

  #   it "should have a quote" do
  #     @meme.quotes.size.should == 2
  #   end
  # end  

end
