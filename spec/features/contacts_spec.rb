# encoding: UTF-8
require 'spec_helper'

describe "Contacts" do
  before(:each) do
    @admin = FactoryGirl.create(:admin)
    @contact = FactoryGirl.create(:contact)

    visit root_path( :locale => "ru" )
    click_link 'Войти'
    fill_in 'Ваш email',  :with => @admin.email
    fill_in 'Пароль', :with => 'qwerty'
    click_button 'Войти'
  end

  describe "Updating" do
    it "should be done with valid attrs" do
      name = 'Some name'

      page.find('#navbar-contacts').click                                                           # Контакты
      click_link 'Редактировать'
      fill_in 'Имя церкви', :with => name
      click_button 'Обновить'

      page.should have_selector( 'address', :text => name )
    end
  end

  describe "Google map" do
    it "should exists on the page" do
      page.find('#navbar-contacts').click                                                           # Контакты

      page.should have_css('div.map_container')
      page.should have_css('div.gmaps4rails_map')
    end
  end
end
