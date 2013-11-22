# GIVEN

Given(/^I have welcome message$/) do
  FactoryGirl.create(:welcome_message)
end

# WHEN

When(/^I go to home page$/) do
  click_link "navbar-home"
end

When(/^I click English flag$/) do
  page.find("#us_flag").click
end

# THEN

Then(/^I should see editor on welcome edit page$/) do
  page.should have_css('ul.wysihtml5-toolbar')
end

Then(/^I should see editor on article new page$/) do
  page.should have_css('ul.wysihtml5-toolbar')
end