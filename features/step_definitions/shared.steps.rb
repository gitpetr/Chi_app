# GIVEN

Given(/^I logged in as admin$/) do
  @admin = FactoryGirl.create(:admin)

  visit new_user_session_path( :locale => "ru" )
  fill_in "Ваш email",  :with => @admin.email
  fill_in "Пароль", :with => 'qwerty'
  click_button "Войти"
end

# WHEN

# THEN