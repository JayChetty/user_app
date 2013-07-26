require 'spec_helper'

describe Shelf do
  before do
    @user = User.create(name:"Jay Chetty", email: "user@example.com", password: "foobarbar", password_confirmation: "foobarbar")
    @shelf=  @user.shelves.create(name: "Test")
  end

  subject(@shelf)

  it {should respond_to(:user_id)}
  it {should respond_to(:name)}
  it {should respond_to(:user)}
  it { should be_valid }

  it "should have the correct user" do
  	@shelf.user_id.should == @user.id
  end
end
