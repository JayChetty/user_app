# == Schema Information
#
# Table name: reads
#
#  id         :integer          not null, primary key
#  shelf_id   :integer
#  isbn       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author     :string(255)
#  title      :string(255)
#  comment    :string(255)
#  image_url  :string(255)
#  url        :string(255)
#

require 'spec_helper'

describe Item do
  before do
    @user = User.new(name:"Jay Chetty", email: "user@example.com", password: "foobarbar", password_confirmation: "foobarbar")
    @user.confirm!
    @shelf = @user.shelves.create(name: "Dystopia")
    @item =  @shelf.items.build(medium: "read")
  end

  subject {@item}

  it {should respond_to(:creator)}
  it {should respond_to(:title)}
  it {should respond_to(:shelf_id)}

  it { should be_valid }

  it "should have the shelf user" do
  	@item.shelf_id.should == @shelf.id
  end

  describe "accessible attributes" do
  	it "should not allow access to shelf_id" do
  		expect do
  			Item.new(shelf_id: @shelf.id)
  		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end
  end
end
