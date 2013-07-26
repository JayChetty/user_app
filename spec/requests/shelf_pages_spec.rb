require 'spec_helper'

describe "ShelfPages" do
  subject { page }

  before do
		@user = User.create(name:"Jay Chetty", email: "user@example.com", password: "foobarbar", password_confirmation: "foobarbar")		
	end

	describe "Non signed in user" do
		describe "visiting user page with shelf" do
			before do 			
				@user.shelves.create(name:"Fantasy")
				visit user_path(@user)
			end
			it {should have_content("Fantasy")}
		end
	end

	describe "Signed in user no shelf" do
		before do 
			sign_in @user
		end
		it {should have_link("Add Shelf")}

		# describe "Adding new shelf" do

		# 	before {click_link("Add Shelf")}
		  
	  it {should have_content("New")}

	  describe "sending form"
	  	before do
	  		fill_in "Name", with: "Dystopia"
	  		click_button "Create Shelf"
	  	end

	  	it "should have added shelf" do
	  		@user.shelves.count.should == 1
	  	end

	    it {should have_content "Dystopia"}
		# end

	end


	describe "Signed in user with shelf" do
		before do 
			@user.shelves.create(name:"Fantasy")
			sign_in @user
		end
		it {should have_content("Fantasy")}
		it {should have_link("Add Shelf")}			
	end

end
