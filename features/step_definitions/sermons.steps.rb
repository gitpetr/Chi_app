# GIVEN

Given(/^There (are|is) (\d+) sermons?$/) do |arg, count|
  count.to_i.times{ FactoryGirl.create(:sermon) }
end

Given(/^I not logged in$/) do
  visit root_path(:locale => :ru)
end

# WHEN

When(/^I go to page with sermons$/) do
  visit root_path(:locale => :ru)
  click_link "navbar-sermons"
end

# THEN

Then(/^I should be on sermon index page$/) do
  current_path.should == sermons_path( :locale => "ru" )
end

Then(/^I should see button to upload a sermon$/) do
  page.should have_css('#sermon-add')
end

Then(/^I shouldn't see button to upload a sermon$/) do
  page.should_not have_css('#sermon-add')
end

Then(/^I should be on sermon show page$/) do
  current_path.to_s.should =~ /sermons\/(\d+)/
end

Then(/^I should see audio player$/) do
  page.should have_css('div.jp-type-single')
end