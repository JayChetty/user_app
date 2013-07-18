require 'spec_helper'

describe "QuotePages" do
  
	subject { page }

  before do
		@user = User.new(name:"Jay Chetty", email: "user@example.com", password: "foobarbar", password_confirmation: "foobarbar")
		@user.save
		sign_in @user
	end

  describe "visiting user quotes path" do
  	before { visit user_quotes_path(@user.id) }
  	it { should have_content('Quotes') } 

  	describe "Adding first quote" do  		
      before do
        visit user_quotes_path(@user.id)
        fill_in "Body",         with: "La"
        fill_in "Author",       with: "Mr Wise"
        click_button "Add"
      end

      it "should create a quote" do
        #expect { click_button "Add" }.to change(Quote, :count).by(1)
        @user.quotes.count.should == 1
      end

      it "should now be current" do
        should have_selector('.current', text: "La") 
      end
  	end

    describe "Adding quote with incorrect info" do      

      it "should not create a quote" do
        expect { click_button "Add" }.not_to change(Quote, :count)
      end

      describe "error messages" do
        before { click_button "Add" }
        it { should have_content('error') } 
      end
    end


  end
end
