# encoding: UTF-8
require 'spec_helper'

describe "Wysihtml5Editors" do
  before(:each) do
    @admin = FactoryGirl.create(:admin)

    visit '/'
    click_link "Войти"
    fill_in "Ваш email",  :with => @admin.email
    fill_in "Пароль", :with => 'qwerty'
    click_button "Войти"

    click_link "Статьи"
    click_link "Создать новую статью"
  end

  describe "Panel" do
    it "should have toolbar for default (russian) version", :js => true do
      page.should have_css('ul.wysihtml5-toolbar')
    end

    it "should have toolbar for english version", :js => true do
      page.find("#us_flag").click                                                                   # Click english flag by id.
      sleep 1.5

      page.should have_css('ul.wysihtml5-toolbar')
    end

    it "should have toolbar for russian version", :js => true do
      page.find("#ru_flag").click
      sleep 1.5

      page.should have_css('ul.wysihtml5-toolbar')
    end
  end
end
