require 'spec_helper'

describe AmazonItems do
  it "should be created with params" do
    amazon_items = AmazonItems.new(medium:"book", creator:"rowling", title:"harry potter")
  end

  it "should be able to fetch items" do
    items_stub = stub(items: [])
    amazon_items = AmazonItems.new(medium:"book", creator:"rowling", title:"harry potter")
    Amazon::Ecs.should_receive(:item_search).and_return(items_stub)
    amazon_items.fetch()
  end

  it "should be able to appear as Array of native items" do
    items_stub = stub(items: [])
    amazon_items = AmazonItems.new(medium:"book", creator:"rowling", title:"harry potter")
    Amazon::Ecs.should_receive(:item_search).and_return(items_stub)
    amazon_items.fetch
    amazon_items.as_native.class.should == Array
  end
end