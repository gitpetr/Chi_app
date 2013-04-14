# encoding: UTF-8
require 'spec_helper'

describe "Users" do
  before(:each) do
    @user = FactoryGirl.create(:user)

    visit '/'
    click_link "Войти"
  end

  describe "Sign in/out" do
    describe "failure" do
      it "should not sign a user in if user login/pass incorrect" do
        fill_in "Ваш email",  :with => ""
        fill_in "Пароль", :with => ""
        click_button "Войти"

        page.should have_selector("div.alert.alert-alert", :text => "Неверный адрес e-mail или пароль.")
      end
    end

    describe "success" do
      it "should sign a user in and out" do
        fill_in "Ваш email",  :with => @user.email
        fill_in "Пароль", :with => 'qwerty'
        click_button "Войти"

        page.should have_selector("div.alert.alert-notice", :text => "Вход в систему выполнен.")
        click_link "Выйти"
        page.should have_selector("div.alert.alert-notice", :text => "Выход из системы выполнен.")
      end
    end
  end

  describe "For signed-in user" do
    before(:each) do
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

        page.should have_selector("div.alert.alert-notice", :text => "Вход в систему выполнен.")
      end
    end

    describe "Articles" do
      it "should not have button to create new article" do
        click_link "navbar-articles"                                                                # Статьи. Clicking by id.
        page.should_not have_selector( 'a', :text => 'Создать новую статью' )
      end

      it "should not have button to edit existing article" do
        @article = FactoryGirl.create( :article )

        click_link "navbar-articles"                                                                # Статьи. Clicking by id.

        within( 'h2' ) do
          page.should_not have_selector( 'a', :text => 'Редактировать' )
        end
      end

      it "should have title which is link on index page and legend on show page" do
        article = FactoryGirl.create( :article )

        click_link "navbar-articles"                                                                # Статьи. Clicking by id.
        click_link article.title

        page.should have_selector( 'h2', :text => article.title )
      end
    end
  end
end
