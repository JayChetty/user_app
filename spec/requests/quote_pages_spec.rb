require 'spec_helper'

describe "QuotePages" do
	subject { page }

  before do
		@user = User.new(name:"Jay Chetty", email: "user@example.com", password: "foobarbar", password_confirmation: "foobarbar")
		@user.save
		sign_in @user
	end

  describe "visiting quotes path" do
  	before { visit user_quotes_path(@user.id) }
  	it { should have_content('Quotes Bank') } 
  end

end
