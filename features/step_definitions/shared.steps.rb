# GIVEN

Given(/^I logged in as admin$/) do
  @admin = FactoryGirl.create(:admin)

  visit new_user_session_path( :locale => "ru" )
  fill_in "Ваш email",  :with => @admin.email
  fill_in "Пароль", :with => 'qwerty'
  click_button "Войти"
end

# WHEN

When(/^I click link "(.*?)"$/) do |str|
  click_link str
end

When(/^I click button "(.*?)"$/) do |str|
  click_button str
end

# THEN