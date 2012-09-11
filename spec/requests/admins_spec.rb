# encoding: UTF-8
require 'spec_helper'

describe "Admins" do
  before(:each) do
    @admin = FactoryGirl.create(:admin)
    visit '/'
    click_link "Войти"
    fill_in "Ваш email",  :with => @admin.email
    fill_in "Пароль", :with => 'qwerty'
    click_button "Войти"
  end

  describe "Admin panel" do
    it "should have correct links" do
      click_link "Пользователи"
      response.should be_success

      click_link "Статьи"
      response.should be_success
    end
  end

  describe "Article" do
    it "should have button to create new article" do
      click_link "Статьи"
      response.should have_selector( 'a', :content => 'Создать новую статью' )
    end

    it "should be created" do
      expect do
        click_link "Статьи"
        click_link "Создать новую статью"
        fill_in "Заголовок",  :with => "random text"
        fill_in "Текст статьи",  :with => "random text"
        click_button "Создать"
      end.should change( Article, :count ).by( 1 )
    end
  end
end
