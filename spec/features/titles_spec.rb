# encoding: UTF-8
require 'spec_helper'

describe "Titles" do
  before(:each) do
    visit '/'
  end

  it "should have title with 'ru' locale" do
    expect(page).to have_title "Преображение во Христе"
  end

  it "should have title with 'en' locale" do
    visit '/en/articles'

    expect(page).to have_title "Transfiguration in Christ"
  end
end