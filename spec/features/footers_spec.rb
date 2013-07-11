# encoding: UTF-8
require 'spec_helper'

describe "Footers" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    visit root_path( :locale => "ru" )
  end

  describe "for each user" do
    it "should link to aricles" do
      click_link "footer-article"                                                                   # Click via id.
      current_path.should == articles_path( :locale => "ru" )
    end

    it "should link to albums" do
      click_link "footer-albums"                                                                    # Click via id.
      current_path.should == albums_path( :locale => "ru" )
    end

    it "should link to contacts" do
      click_link "footer-contacts"                                                                  # Click via id.
      current_path.should == contacts_path( :locale => "ru" )
    end
  end

  describe "for non-signed users" do
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
      visit root_path( :locale => "ru" )
    end

    it "should not show link to login" do
      page.should_not have_selector("a", :text => "Войти" )
    end

    it "should show setting's link" do
      page.should have_selector("a", :text => "Настройки" )
    end
  end
end
