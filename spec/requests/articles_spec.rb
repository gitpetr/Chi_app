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
      click_link "Статьи"
      page.should have_selector( 'a', :text => 'Создать новую статью' )
    end

    describe "Change" do
      before(:each){ @article = FactoryGirl.create( :article ) }

      it "should have button to сhange existing article" do
        click_link "Статьи"

        within( 'div', :class => 'article-edit-button btn-group' ) do
          page.should have_selector( 'a', :text => 'Изменить' )
        end
      end

      it "should have links to edit" do
        click_link "Статьи"
        page.should have_selector('a', :text => 'Редактировать')
      end

      it "should have links to delete article" do
        click_link "Статьи"
        page.should have_selector('a', :text => 'Удалить')
      end
    end
  end

  describe "Creation" do
    it "should be done with valid attrs" do
      expect do
        click_link "Статьи"
        click_link "Создать новую статью"
        fill_in "Заголовок",  :with => "random text"
        fill_in "Текст статьи",  :with => "random text"
        click_button "Создать"
      end.should change( Article, :count ).by( 1 )
    end
  end

  describe "Updating" do
    it "should be done with valid attrs" do
      @article = FactoryGirl.create( :article ); title = "title text"; content = "content text"

      click_link "Статьи"
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

      click_link "Статьи"
      click_link "Изменить"
      click_link "Удалить"
      sleep 0.3                                                                     # Here we sleep because js need some time to show message.
      click_link "Удалить"

      page.should have_selector('div', :text => 'Статья была успешно удалена!')
    end
  end
end
