# encoding: UTF-8
require 'spec_helper'

describe "Admins" do
  before(:each) do
    @admin = FactoryGirl.create(:admin)

    visit '/'
    click_link "Войти"
    fill_in "Ваш email",  :with => @admin.email
    fill_in "Пароль", :with => 'qwerty'
    click_button "Войти"
  end

  describe "Admin panel" do
    it "should have correct links" do
      click_link "Пользователи"
      current_path.should == "/ru/users_list"

      click_link "Статьи"
      current_path.should == "/ru/articles"
    end
  end

  describe "Article" do
    describe "Buttons" do
      it "should have button to create new article" do
        click_link "Статьи"
        page.should have_selector( 'a', :content => 'Создать новую статью' )
      end

      describe "Change" do
        before(:each){ @article = FactoryGirl.create( :article ) }

        it "should have button to сhange existing article" do
          click_link "Статьи"
          page.should have_selector( 'h2' ) do |h2|
            h2.should have_selector( 'div', :class => 'article-edit-button btn-group' ) do |div|
              div.should have_selector( 'a', :content => 'Изменить' )
            end
          end
        end

        it "should have links to edit and delete article inside of change button" do
          click_link "Статьи"
          page.should have_selector( 'div', :class => 'article-edit-button btn-group' ) do |div|
            div.should have_selector( 'ul', :class => 'dropdown-menu') do |ul|
              ul.should have_selector( 'li' ) do |li|
                li.should have_selector('a', :content => 'Редактировать')
                li.should have_selector('a', :content => 'Удалить')
              end
            end
          end
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

        page.should have_selector( 'h2' ){ |h2| h2.should have_selector( 'a', :content => title ) }
        page.should have_selector( 'p', :content => content )
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

        page.should have_selector('div', :content => 'Статья была успешно удалена!')
      end
    end
  end
end
