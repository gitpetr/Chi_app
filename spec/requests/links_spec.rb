# encoding: UTF-8
require 'spec_helper'

describe "Links" do
  before(:each){ @user = FactoryGirl.create(:user) }

  describe "of footer" do
    describe "for non-signed users" do
      it "should show link to login" do
        visit '/'
        response.should have_selector("a", :href => new_user_session_path, :content => "Войти" )
      end

      it "should not show setting's link" do
        visit '/'
        response.should_not have_selector("a", :href => edit_user_registration_path, :content => "Настройки" )
      end
    end

    describe "for signed-in users" do
      before(:each) do
        visit '/'
        click_link "Войти"
        fill_in "Ваш email",  :with => @user.email
        fill_in "Пароль", :with => 'qwerty'
        click_button "Войти"
      end

      it "should not show link to login" do
        visit '/'
        response.should_not have_selector("a", :href => new_user_session_path, :content => "Войти" )
      end

      it "should show setting's link" do
        visit '/'
        response.should have_selector("a", :href => edit_user_registration_path, :content => "Настройки" )
      end
    end
  end
end
