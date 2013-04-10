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
        click_link "navbar-photos"                                                                  # Фотографии. Clicking by id.
        page.should have_selector( 'a', :text => 'Добавить фотографии' )
      end
    end

    describe "Creation" do
      before(:each) do
        click_link "navbar-photos"                                                                  # Фотографии. Clicking by id.
        click_link "Добавить фотографии"
      end

      it "should upload single photo" do
        attach_file "Путь к изображению", "#{Rails.root}/spec/fixtures/files/violin.jpg"
        click_button "Загрузить"

        page.should have_css('div.alert.alert-success')
      end

      it "should inform user if he tries to upload without attached file" do
        click_button "Загрузить"

        page.should have_css('div.alert.alert-info')
      end
    end

    describe "Updating" do
      it "should be done with valid attrs" do
        @photo = FactoryGirl.create( :photo )

        click_link "navbar-photos"                                                                  # Фотографии. Clicking by id.
        click_link "Изменить"
        click_link "Редактировать"
        fill_in "Описание",  :with => "Here is new description"
        click_button "Обновить"

        page.should have_css('div.alert.alert-success')
      end
    end

    describe "Deleting" do
      it "should be done", :js => true do
        @photo = FactoryGirl.create( :photo )

        click_link "navbar-photos"                                                                  # Фотографии. Clicking by id.
        click_link "Изменить"
        click_link "Удалить"

        page.should have_css('div.alert.alert-success')
      end
    end
  end
end
