# encoding: UTF-8
require 'spec_helper'

describe "Links" do
  before(:each){ @user = FactoryGirl.create(:user) }

  describe "of footer" do
    it "should show link to login for non-signed users" do
      visit '/'
      response.should have_selector("a", :href => new_user_session_path, :content => "Войти" )
    end

    it "should not show link to login for signed-in user" do
      visit '/'
      click_link "Войти"
      fill_in "Ваш email",  :with => @user.email
      fill_in "Пароль", :with => 'qwerty'
      click_button "Войти"
      response.should_not have_selector("a", :href => new_user_session_path, :content => "Войти" )
    end
  end
end
