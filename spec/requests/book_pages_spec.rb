require 'spec_helper'

describe "BookPages" do
  describe "index page" do
    it "should have search form" do
      visit books_path
      page.should have_button "Find"
    end

    it "should have search form" do
      visit books_path
      click_button "Find"
      page.should have_content "Please enter"
    end

    it "should find forms" do
      visit books_path
      fill_in "Title",         with: "Brave New World"
      click_button "Find"
      page.should have_content "Aldous Huxley"
      page.should_not have_content "Add Read"
    end
  end
end
