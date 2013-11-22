# encoding: UTF-8
require 'spec_helper'

describe "Users" do
  before(:each) do
    @user = FactoryGirl.create(:user)

    visit new_user_session_path( :locale => "ru" )
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

        visit new_user_session_path( :locale => "ru" )
        fill_in "Ваш email",  :with => @user.email
        fill_in "Пароль", :with => new_pass
        click_button "Войти"

        page.should have_selector("div.alert.alert-notice", :text => "Вход в систему выполнен.")
      end
    end
  end
end
