# GIVEN

Given(/^There is a user$/) do
  @user = FactoryGirl.create(:user)
end

# WHEN

When(/^I visit page to sign in$/) do
  visit new_user_session_path( :locale => "ru" )
end

When(/^I try to sign in with incorrect data$/) do
  fill_in "Ваш email",  :with => ""
  fill_in "Пароль", :with => ""
  click_button "Войти"
end

When(/^I try to sign in with correct data$/) do
  fill_in "Ваш email",  :with => @user.email
  fill_in "Пароль", :with => 'qwerty'
  click_button "Войти"
end

# THEN

Then(/^I should see message that email or password is wrong$/) do
  page.should have_content "Неверный адрес e-mail или пароль."
end

Then(/^I should see message that i signed in$/) do
  page.should have_content "Вход в систему выполнен."
end

Then(/^I should see message that i signed out$/) do
  page.should have_content "Выход из системы выполнен."
end



