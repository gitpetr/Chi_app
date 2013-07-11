# encoding: UTF-8
require 'spec_helper'

describe "Navbar" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    visit root_path( :locale => "ru" )
  end

  it "should visit articles via brand name" do
    click_link "Преображение во Христе"
    current_path.should == root_path( :locale => "ru" )
  end

  it "should visit home page" do
    click_link "navbar-home"                                                                        # Click via id.
    current_path.should == root_path( :locale => "ru" )
  end

  it "should visit articles" do
    click_link "navbar-articles"                                                                    # Click via id.
    current_path.should == articles_path( :locale => "ru" )
  end

  it "should visit albums" do
    click_link "navbar-albums"                                                                      # Click via id.
    current_path.should == albums_path( :locale => "ru" )
  end

  it "should visit contacts" do
    click_link "navbar-contacts"                                                                    # Click via id.
    current_path.should == contacts_path( :locale => "ru" )
  end
end

