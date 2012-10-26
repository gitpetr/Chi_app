# encoding: UTF-8
require 'spec_helper'

describe "Contacts" do
  before(:each) do
    @admin = FactoryGirl.create(:admin)
    @contact = FactoryGirl.create(:contact)

    visit '/'
    click_link 'Войти'
    fill_in 'Ваш email',  :with => @admin.email
    fill_in 'Пароль', :with => 'qwerty'
    click_button 'Войти'
  end

  describe "Updating" do
    it "should be done with valid attrs" do
      name = 'Some name'

      click_link 'Контакты'
      click_link 'Редактировать'
      fill_in 'Имя церкви', :with => name
      click_button 'Обновить'

      page.should have_selector( 'address', :text => name )
    end
  end
end
