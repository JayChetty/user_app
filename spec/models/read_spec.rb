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

describe Read do
  before do
    @user = User.new(name:"Jay Chetty", email: "user@example.com", password: "foobarbar", password_confirmation: "foobarbar")
    @user.confirm!
    @shelf = @user.shelves.create(name: "Dystopia")
    @read =  @shelf.reads.build(isbn: "9781907832567")
  end

  subject {@read}

  it {should respond_to(:isbn)}
  it {should respond_to(:author)}
  it {should respond_to(:title)}
  it {should respond_to(:shelf_id)}

  it { should be_valid }

  it "should have the shelf user" do
  	@read.shelf_id.should == @shelf.id
  end

  describe "accessible attributes" do
  	it "should not allow access to shelf_id" do
  		expect do
  			Read.new(shelf_id: @shelf.id)
  		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end
  end
end
