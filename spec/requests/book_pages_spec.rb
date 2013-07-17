require 'spec_helper'

describe "BookPages" do
  describe "index page" do
    it "should have search form" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit books_path
      page.should have_button "Find"
    end
  end
end
