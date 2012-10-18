# encoding: UTF-8
require 'spec_helper'

describe "Slideshows" do
  before(:each) do
    @admin = FactoryGirl.create( :admin )

    visit '/'
    click_link "Войти"
    fill_in "Ваш email",  :with => @admin.email
    fill_in "Пароль", :with => 'qwerty'
    click_button "Войти"

    FactoryGirl.create( :photo )
    FactoryGirl.create( :photo, :image => File.open(File.join(Rails.root, '/spec/fixtures/files/cello.jpg')) )
  end

  it "should show slideshow when button 'slideshow' clicked", :js => true do
    click_link "Фотографии"
    click_link "Показать фотографии"
    page.should have_selector('h3', :text => 'Слайды')
  end
end
