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
#  admin                  :boolean          default(FALSE)
#

require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :email => "qwerty@qwerty.com", :password => "qwerty" }
  end

  describe "DB" do
    it "should create user with valid params" do
      expect do
        user = User.create( @attr )
      end.should change( User, :count ).by( 1 )
    end

    it "should not create user with invalid params" do
      expect do
        user = User.create( @attr.merge :email => "", :password => "" )
      end.should_not change( User, :count )
    end
  end

  describe "Validations for" do
    it "admin's attribute should = false when user has been created" do
      user = User.create( @attr )
      user.admin.should be_false
    end

    it "email can't be empty" do
      user = User.create( @attr.merge :email => "" )
      user.should_not be_valid
    end

    it "password can't be empty" do
      user = User.create( @attr.merge :password => "" )
      user.should_not be_valid
    end
  end
end
