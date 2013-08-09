require 'spec_helper'

describe "Sermons" do
  describe "Admin" do
    before(:each) do
      @admin = FactoryGirl.create(:admin)

      visit new_user_session_path( :locale => "ru" )
      fill_in "Ваш email",  :with => @admin.email
      fill_in "Пароль", :with => 'qwerty'
      click_button "Войти"
    end

    describe "No sermons" do
      before(:each) do
        click_link "navbar-sermons"
      end

      it "shows index page if we don't have sermons" do
        current_path.should == sermons_path( :locale => "ru" )
      end

      it "should have button to upload a sermon" do
        page.should have_css('#sermon-add')
      end
    end

    describe "Uploaded" do
      before(:each) do
        @sermon = FactoryGirl.create(:sermon)

        click_link "navbar-sermons"
      end

      it "shows show page if we have at least 1 sermon" do
        current_path.should == sermon_path( :locale => "ru", :id => @sermon )
      end

      it "shows audio player if we have at least 1 sermon", :js => true do
        sleep 2
        page.should have_css('div.jp-type-single')
      end
    end
  end
end