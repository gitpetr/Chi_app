# encoding: UTF-8
require 'spec_helper'

describe "Links" do
  before(:each){ @user = FactoryGirl.create(:user) }

  describe "Navbar" do
    it "should visit articles" do
      visit '/'
      click_link "Статьи"
      current_path.should == "/ru/articles"
    end

    it "should visit articles via brand name" do
      visit '/'
      click_link "Преображение во Христе"
      current_path.should == "/ru/articles"
    end

    it "should visit photos" do
      visit '/'
      click_link "Фотографии"
      current_path.should == "/ru/photos"
    end
  end

  describe "Footer" do
    describe "for non-signed users" do
      it "should show link to login" do
        visit '/'
        page.should have_selector("a", :href => "ru/users/sign_in", :text => "Войти" )
      end

      it "should not show setting's link" do
        visit '/'
        page.should_not have_link("a", :href => "ru/users/edit", :text => "Настройки" )
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
        page.should_not have_link("a", :href => "ru/users/sign_in", :text => "Войти" )
      end

      it "should show setting's link" do
        visit '/'
        page.should have_selector("a", :href => "ru/users/edit", :text => "Настройки" )
      end
    end
  end
end
