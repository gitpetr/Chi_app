# encoding: UTF-8
require 'spec_helper'

describe "Footers" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    visit '/'
  end

  describe "for each user" do
    it "should link to aricles" do
      click_link "footer-article"                                                                   # Click via id.
      current_path.should == "/ru/articles"
    end

    it "should link to albums" do
      click_link "footer-albums"                                                                    # Click via id.
      current_path.should == "/ru/albums"
    end

    it "should link to contacts" do
      click_link "footer-contacts"                                                                  # Click via id.
      current_path.should == "/ru/contacts"
    end
  end

  describe "for non-signed users" do
    it "should show link to login" do
      page.should have_selector("a", :text => "Войти" )
    end

    it "should not show setting's link" do
      page.should_not have_selector("a", :text => "Настройки" )
    end
  end

  describe "for signed-in users" do
    before(:each) do
      click_link "Войти"
      fill_in "Ваш email",  :with => @user.email
      fill_in "Пароль", :with => 'qwerty'
      click_button "Войти"
      visit '/'
    end

    it "should not show link to login" do
      page.should_not have_selector("a", :text => "Войти" )
    end

    it "should show setting's link" do
      page.should have_selector("a", :text => "Настройки" )
    end
  end
end
