# encoding: UTF-8
require 'spec_helper'

describe "Paginations" do
  describe "Articles" do
    before(:each) do
      6.times{ FactoryGirl.create(:article) }
      visit '/'
      click_link "Статьи"
    end

    it "should have pagination" do
      page.should have_css('div.pagination.pagination-centered')
    end

    it "should have link to last page for 6 Articles" do
      page.should have_selector('a', :text => "Последняя »")
    end
  end
end
