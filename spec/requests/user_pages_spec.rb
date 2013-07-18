require 'spec_helper'

describe "UserPages" do

	subject { page }

  before do
		@user = User.new(name:"Jay Chetty", email: "user@example.com", password: "foobarbar", password_confirmation: "foobarbar")
		@user.save
		sign_in @user
  end
  describe "On profile page" do
  	
    it "should have link to user" do
    	page.should have_link("Users")
    end

    it "should show users" do
    	click_link "Users"
    	page.should have_content "Users"
    end
  end
end

  
