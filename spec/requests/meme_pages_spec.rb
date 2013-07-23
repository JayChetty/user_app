require 'spec_helper'

describe "MemePages" do
  
  subject { page }

  before do
		@user = User.new(name:"Jay Chetty", email: "user@example.com", password: "foobarbar", password_confirmation: "foobarbar")
		@user.save
    sign_in @user 
	end


  describe "memes index" do
    before{ visit user_memes_path(@user)}
    it "should show default quote" do
      page.should have_content('Default quote')
    end  

    it "should have option to Add" do
      page.should have_link('Add Meme')
    end


    it "should be able to add Meme" do
      expect { click_link('Add Meme') }.to change(Meme, :count).by(1)
    end


 
  end



 
end
