require 'spec_helper'

describe User do
  before do
    @user = User.new(name:"Jay Chetty", email: "user@example.com", password: "foobarbar", password_confirmation: "foobarbar")
  end

  subject {@user}

  it {should respond_to(:email)}
  it {should respond_to(:name)}

  it { should be_valid }

  describe "When name does not exist" do
  	before {@user.name = nil}
  	it {should_not be_valid}
  end
end
