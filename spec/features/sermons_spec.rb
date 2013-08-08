require 'spec_helper'

describe "Sermons" do
  before(:each) do
    @user = FactoryGirl.create(:user)

    visit root_path( :locale => "ru" )
  end

  describe "No sermons" do
    it "shows index page if we don't have sermons" do
      click_link "navbar-sermons"
      current_path.should == sermons_path( :locale => "ru" )
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