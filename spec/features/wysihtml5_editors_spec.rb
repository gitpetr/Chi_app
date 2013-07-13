# encoding: UTF-8
require 'spec_helper'

describe "Wysihtml5Editors" do
  before(:each) do
    @admin = FactoryGirl.create(:admin)

    visit new_user_session_path( :locale => "ru" )
    fill_in "Ваш email",  :with => @admin.email
    fill_in "Пароль", :with => 'qwerty'
    click_button "Войти"
  end

  describe "Panel in articles" do
    before(:each) do
      click_link "navbar-articles"                                                                  # Статьи. Clicking by id.
      click_link "Новая статья"
    end

    it "should have toolbar for default (russian) version", :js => true do
      page.should have_css('ul.wysihtml5-toolbar')
    end

    it "should have toolbar for english version", :js => true do
      page.find("#us_flag").click                                                                   # Click english flag by id.
      sleep 3

      page.should have_css('ul.wysihtml5-toolbar')
    end
  end

  describe "Panel in welcome message" do
    before(:each) do
      FactoryGirl.create(:welcome_message)

      click_link "navbar-home"                                                                      # Главная.
      click_link "Редактировать"
    end

    it "should have toolbar for default (russian) version", :js => true do
      page.should have_css('ul.wysihtml5-toolbar')
    end

    it "should have toolbar for english version", :js => true do
      page.find("#us_flag").click
      sleep 3

      page.should have_css('ul.wysihtml5-toolbar')
    end
  end
end
