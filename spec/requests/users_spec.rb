# encoding: UTF-8
require 'spec_helper'

describe "Users" do
  before(:each){ @user = FactoryGirl.create(:user) }

  describe "Sign in/out" do
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

        controller.should be_signed_in
        click_link "Выйти"
        controller.should_not be_signed_in
      end
    end
  end

  describe "For signed-in user" do
    before(:each) do
      visit '/'
      click_link "Войти"
      fill_in "Ваш email",  :with => @user.email
      fill_in "Пароль", :with => 'qwerty'
      click_button "Войти"
    end

    describe "Settings" do
      it "should change password and log-in in system with new password" do
        new_pass = 'qwerty1'

        click_link "Настройки"
        fill_in "Ваш email", :with => @user.email
        fill_in "Новый пароль", :with => new_pass
        fill_in "Подтверждение нового пароля", :with => new_pass
        fill_in "Ваш текущий пароль", :with => 'qwerty'
        click_button 'Обновить'

        click_link "Выйти"
        click_link "Войти"
        fill_in "Ваш email",  :with => @user.email
        fill_in "Пароль", :with => new_pass
        click_button "Войти"
        controller.should be_signed_in
      end
    end

    describe "Articles" do
      it "should not have button to create new article" do
        click_link "Статьи"
        response.should_not have_selector( 'a', :content => 'Создать новую статью' )
      end

      it "should have title which is link on index page and legend on show page" do
        article = FactoryGirl.create(:article)
        click_link "Статьи"
        click_link article.title
        response.should have_selector('h2', :content => article.title)
      end
    end
  end
end
