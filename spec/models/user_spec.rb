# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  current_quote_id       :integer
#

require 'spec_helper'

describe User do
  before do
    @user = User.new(name:"Jay Chetty", email: "user@example.com", password: "foobarbar", password_confirmation: "foobarbar")  
  end

  subject {@user}

  it {should respond_to(:email)}
  it {should respond_to(:name)}

  it {should respond_to(:quotes)}
  it {should respond_to(:current_quote)}

  it { should be_valid }

  # describe "at the start" do
  #   before{@user.save}
  #   it "should have a default meme" do
  #     @user.memes.size.should == 1
  #   end
  # end   

  describe "When name does not exist" do
  	before {@user.name = nil}
  	it {should_not be_valid}
  end 

  # describe "New meme added" do
  #   before do      
  #     @user.save
  #     @meme = @user.memes.create  
  #   end

  #   it "should have a meme" do
  #     @user.memes.size.should == 2
  #   end
  # end


end
