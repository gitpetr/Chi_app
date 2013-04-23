# encoding: UTF-8
require 'spec_helper'

describe "Articles" do
  before(:each) do
    @admin = FactoryGirl.create(:admin)

    visit '/'
    click_link "Войти"
    fill_in "Ваш email",  :with => @admin.email
    fill_in "Пароль", :with => 'qwerty'
    click_button "Войти"
  end

  describe "Buttons" do
    it "should have button to create new article" do
      page.find("#navbar-articles").click                                                           # Статьи.
      page.should have_selector( 'a', :text => 'Новая статья' )
    end

    describe "Change" do
      before(:each){ @article = FactoryGirl.create( :article ) }

      it "should have button to сhange existing article" do
        page.find("#navbar-articles").click                                                         # Статьи.

        within( 'div.article-edit-button.btn-group' ) do
          page.should have_selector( 'a', :text => 'Изменить' )
        end
      end

      it "should have links to edit" do
        page.find("#navbar-articles").click                                                         # Статьи.
        page.should have_selector('a', :text => 'Редактировать')
      end

      it "should have links to delete article" do
        page.find("#navbar-articles").click                                                         # Статьи.
        page.should have_selector('a', :text => 'Удалить')
      end
    end
  end

  describe "Creation" do
    it "should be done with valid attrs" do
      expect do
        page.find("#navbar-articles").click                                                         # Статьи.
        click_link "Новая статья"
        fill_in "Заголовок",  :with => "random text"
        fill_in "Текст статьи",  :with => "random text"
        click_button "Создать"
      end.to change( Article, :count ).by( 1 )
    end
  end

  describe "Updating" do
    it "should be done with valid attrs" do
      @article = FactoryGirl.create( :article ); title = "title text"; content = "content text"

      page.find("#navbar-articles").click                                                           # Статьи.
      click_link "Изменить"
      click_link "Редактировать"
      fill_in "Заголовок",  :with => title
      fill_in "Текст статьи",  :with => content
      click_button "Обновить"

      within( 'h2' ){ page.should have_selector( 'a', :text => title ) }
      page.should have_selector( 'p', :text => content )
    end
  end

  describe "Deleting" do
    it "should be done", :js => true do
      @article = FactoryGirl.create( :article )

      page.find("#navbar-articles").click                                                           # Статьи.
      click_link "Изменить"
      click_link "Удалить"
      sleep 0.5                                                                                     # Here we sleep because js need some time to show message.
      click_link "destroy_link"                                                                     # Click delete link in window via id.

      page.should have_selector('div', :text => 'Статья была успешно удалена!')
    end
  end
end
