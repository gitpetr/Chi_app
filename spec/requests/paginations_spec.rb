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
      response.should have_selector('div', :class => 'pagination pagination-centered')
    end

    it "should have link to last page for 6 Articles" do
      response.should have_selector('div', :class => 'pagination pagination-centered') do |div|
        div.should have_selector('ul') do |ul|
          ul.should have_selector('li', :class => 'last')
        end
      end
    end
  end
end
