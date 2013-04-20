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

    @text1 = "my super text1"; @text2 = "my super text2"
    FactoryGirl.create( :photo, :description => @text1 )
    FactoryGirl.create( :photo,
                        :description => @text2,
                        :image => File.open(File.join( Rails.root, '/spec/fixtures/files/cello.jpg' )))

    click_link "navbar-photos"                                                                      # Фотографии. Clicking by id.
  end

  describe "Slideshow button" do
    before(:each){ click_link "Показать фотографии" }

    it "should show slideshow when button 'slideshow' clicked", :js => true do
      page.should have_selector('h3', :text => 'Слайды')
    end

    it "should move to other slide by clicking in arrow", :js => true  do
      page.should have_selector('p', :text => @text1)

      click_link "›"
      page.should have_selector('p', :text => @text2)
    end

    it "should hide modal window when user click x-arrow", :js => true do
      page.should have_selector('h3', :text => 'Слайды')
      click_button "×"
      page.should_not have_selector('h3', :text => 'Слайды')
    end
  end

  it "should show slideshow when image clicked", :js => true do
    sleep 0.5                                                                                       # without sleeping test fails.
    first(:css, 'img').click                                                                        # Find the first one image and click it.
    page.should have_selector('h3', :text => 'Слайды')
  end
end
