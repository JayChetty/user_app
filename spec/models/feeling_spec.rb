# == Schema Information
#
# Table name: feelings
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  content       :text
#  feelable_id   :integer
#  feelable_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe Feeling do
  
  before do
    @user = User.create(name:"Jay Chetty", email: "user@example.com", password: "foobarbar", password_confirmation: "foobarbar")
    @user.confirm!
    @shelf = @user.shelves.create(name: "Dystopia")
    @read =  @shelf.reads.create(isbn: "9781907832567")
    @feeling = @user.feelings.create(feelable_id: @read.id, feelable_type: "Read", content: "liking it")
  end

  subject {@feeling}

  it {should respond_to(:user_id)}
  it {should respond_to(:user)}
  it {should respond_to(:content)}
  it {should respond_to(:feelable_id)}
  it {should respond_to(:feelable_type)}
  it {should respond_to(:feelable)}

  describe "accessible attributes" do
  	it "should not allow access to feelable_id" do
  		expect do
  			Feeling.new(user_id: @user.id)
  		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end
  end
end
