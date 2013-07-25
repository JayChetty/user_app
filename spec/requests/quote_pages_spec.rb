require 'spec_helper'

describe "QuotePages" do
  
	subject { page }

  before do
		@user = User.create(name:"Jay Chetty", email: "user@example.com", password: "foobarbar", password_confirmation: "foobarbar")
   # @quote = @user.quotes.create(author:"Walt Whitman", body:"lala")
		sign_in @user
	end

  describe "visiting user quotes path" do
  	before { visit user_quotes_path(@user.id) }
  	it { should have_content('Quotes') } 


  	describe "Adding new quote" do  		
      before do
        fill_in "Body",         with: "La"
        fill_in "Author",       with: "Mr Wise"
        click_button "Add"
      end

      it "should create a new quote" do
        @user.quotes.count.should == 1
      end

      describe "Making Current" do
        it { should have_link ('Make current') }
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

    # describe "Deletion" do
    #   it { should have_link('Delete') }

    #   describe "clicking delete on current" do
    #     it "should not remove quote as current" do
    #       expect { click_link "Delete" }.not_to change(Quote, :count)
    #     end
    #   end
    # end   




  end
end
