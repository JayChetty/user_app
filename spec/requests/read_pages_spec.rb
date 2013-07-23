require 'spec_helper'

describe "ReadPages" do
  subject { page }

  before do
		@user = User.new(name:"Jay Chetty", email: "user@example.com", password: "foobarbar", password_confirmation: "foobarbar")
		@user.save
		@meme = @user.memes.first
    sign_in @user 
    visit user_meme_reads_path(@user, @meme)
  end
  describe "memes index" do
  	it {should have_link "Add Read"}  
  end

  describe "creating new meme" do
  	before{ click_link "Add Read"}
  	it {should have_content "New Read"}  
  end
end
