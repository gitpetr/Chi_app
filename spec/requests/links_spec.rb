# encoding: UTF-8
require 'spec_helper'

describe "Links" do
  before(:each){ @user = FactoryGirl.create(:user) }

  describe "Navbar" do
    before(:each){ visit '/' }

    it "should visit articles" do
      click_link "Статьи"
      current_path.should == "/ru/articles"
    end

    it "should visit articles via brand name" do
      click_link "Преображение во Христе"
      current_path.should == "/ru/articles"
    end

    it "should visit photos" do
      click_link "Фотографии"
      current_path.should == "/ru/photos"
    end

    it "should visit contacts" do
      click_link "Контакты"
      current_path.should == "/ru/contacts"
    end
  end
end
