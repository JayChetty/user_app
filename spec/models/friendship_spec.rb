# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  status     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Friendship do
  before do
    @user = User.new(name:"Jay Chetty", email: "user@example.com", password: "foobarbar", password_confirmation: "foobarbar")  
    @user2 = User.new(name:"Kieran Heil", email: "user2@example.com", password: "foobarbar", password_confirmation: "foobarbar")  
    User.update_all(:confirmed_at => Time.now)
    @user.save
    @user2.save    
    @user.request_friend(@user2)
    @request = @user.friendships.first
    @pend = @user2.friendships.first
  end

  subject(@request)


  it {should respond_to(:user_id)}
  it {should respond_to(:friend_id)}
  it {should respond_to(:status)}

  describe "requested friendship" do
  	it "should be requested" do
  		@request.status.should == "requested"
  	end

    it "user should have friendship" do
  		@user.friendships.size.should == 1
  	end

  	it "user should not have a friend yet" do
  		@user.friends.size.should == 0
  	end
  end

  describe "pending friendship" do

  	it "should be pending" do
  		@pend.status.should == "pending"
  	end

  	it "user should have a friendship" do
  		@user2.friendships.size.should == 1
  	end

  	it "user should not have a friend yet" do
  		@user2.friends.size.should == 0
  	end
  end

  describe "confirming friend request" do
  	before do
  		@user2.confirm_friend(@user)
  	end

  	it "first should be frinds with second" do
  		@user.friends.size.should == 1
  		
  	end

  	it "second should be frinds with first" do
  		@user2.friends.size.should == 1
  	end

  end
end
