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
      current_path.should == "/ru/users_list"

      click_link "Статьи"
      current_path.should == "/ru/articles"
    end
  end
end
