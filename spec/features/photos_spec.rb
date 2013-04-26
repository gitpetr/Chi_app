# encoding: UTF-8
require 'spec_helper'

describe "Photos" do
  describe "For admin" do
    before(:each) do
      @admin = FactoryGirl.create( :admin )
      @album = FactoryGirl.create( :album )
      @photo = FactoryGirl.create( :photo, :album => @album )

      visit '/'
      click_link "Войти"
      fill_in "Ваш email",  :with => @admin.email
      fill_in "Пароль", :with => 'qwerty'
      click_button "Войти"
      click_link "navbar-albums"                                                                  # Clicking by id.
      click_link "album-#{@album.id}"
    end

    describe "Buttons" do
      it "should have button to create new photo" do
        page.should have_selector( 'a', :text => 'Добавить фотографии' )
      end
    end

    describe "Creation" do
      before(:each) do
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
        click_link "Редактировать"
        fill_in "Описание",  :with => "Here is new description"
        click_button "Обновить"

        page.should have_css('div.alert.alert-success')
      end
    end

    describe "Deleting" do
      it "should be done" do
        click_link "Удалить"

        page.should have_css('div.alert.alert-success')
      end
    end
  end
end
