# encoding: UTF-8
require 'spec_helper'

describe "Users" do
  before(:each){ @user = FactoryGirl.create(:user) }

  describe "sign in/out" do
    describe "failure" do
      it "should not sign a user in if user login/pass incorrect" do
        visit '/'
        click_link "Войти"
        fill_in "Ваш email",  :with => ""
        fill_in "Пароль", :with => ""
        click_button "Войти"

        response.should have_selector("div.alert.alert-alert", :content => "Неверный адрес e-mail или пароль.")
      end
    end

    describe "success" do
      it "should sign a user in and out" do
        visit '/'
        click_link "Войти"
        fill_in "Ваш email",  :with => @user.email
        fill_in "Пароль", :with => 'qwerty'
        click_button "Войти"

        # controller.should be_signed_in
        click_link "Выйти"
        # controller.should_not be_signed_in
      end
    end
  end
end
