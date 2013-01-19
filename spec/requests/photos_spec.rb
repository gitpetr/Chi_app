# encoding: UTF-8
require 'spec_helper'

describe "Photos" do
  describe "For admin" do
    before(:each) do
      @admin = FactoryGirl.create( :admin )

      visit '/'
      click_link "Войти"
      fill_in "Ваш email",  :with => @admin.email
      fill_in "Пароль", :with => 'qwerty'
      click_button "Войти"
    end

    describe "Buttons" do
      it "should have button to create new photo" do
        click_link "Фотографии"
        page.should have_selector( 'a', :text => 'Создать новую фотографию' )
      end
    end

    describe "Creation" do
      it "should be done with valid attrs" do
        click_link "Фотографии"
        click_link "Создать новую фотографию"
        attach_file "Путь к изображению", "#{Rails.root}/spec/fixtures/files/violin.jpg"
        click_button "Загрузить"

        page.should have_selector('div', :text => 'Фотография была успешно сохранена!')
      end
    end

    describe "Updating" do
      it "should be done with valid attrs" do
        @photo = FactoryGirl.create( :photo )

        click_link "Фотографии"
        click_link "Изменить"
        click_link "Редактировать"
        fill_in "Описание",  :with => "Here is new description"
        click_button "Обновить"

        page.should have_selector('div', :text => 'Фотография была успешно обновлена!')
      end
    end

    describe "Deleting" do
      it "should be done", :js => true do
        @photo = FactoryGirl.create( :photo )

        click_link "Фотографии"
        click_link "Изменить"
        click_link "Удалить"
        sleep 0.3                                                                     # Here we sleep because js need some time to show message.
        click_link "destroy_link"                                                     # Click delete link in window via id.

        page.should have_selector('div', :text => 'Фотография была успешно удалена!')
      end
    end
  end
end
