# encoding: UTF-8
require 'spec_helper'

describe "Photos" do
  describe "For admin" do
    before(:each) do
      @admin = FactoryGirl.create(:admin)

      visit '/'
      click_link "Войти"
      fill_in "Ваш email",  :with => @admin.email
      fill_in "Пароль", :with => 'qwerty'
      click_button "Войти"
    end

    describe "Buttons" do
      it "should have button to create new photo" do
        click_link "Фотографии"
        page.should have_selector( 'a', :content => 'Создать новую фотографию' )
      end
    end

    describe "Creation" do
      it "should be done with valid attrs" do
        click_link "Фотографии"
        click_link "Создать новую фотографию"
        fill_in "Описание",  :with => "random text"
        attach_file "Путь к изображению", "#{Rails.root}/spec/fixtures/files/violin.jpg"
        click_button "Создать"

        page.should have_selector('div', :content => 'Изображение успешно сохранено! ')
      end
    end
  end
end
