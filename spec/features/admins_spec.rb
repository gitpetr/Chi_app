# encoding: UTF-8
require 'spec_helper'

describe "Admins" do
  before(:each) do
    @admin = FactoryGirl.create(:admin)

    visit root_path( :locale => "ru" )
    click_link "Войти"
    fill_in "Ваш email",  :with => @admin.email
    fill_in "Пароль", :with => 'qwerty'
    click_button "Войти"
  end

  describe "Admin panel" do
    it "should have correct links" do
      click_link "Пользователи"
      current_path.should == users_list_path( :locale => "ru" )
    end
  end
end
