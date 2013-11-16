# GIVEN

Given(/^There is contact$/) do
  @contact = FactoryGirl.create(:contact)
end

# WHEN

When(/^I go to contacts$/) do
  visit root_path(:locale => :ru)
  page.find('#navbar-contacts').click
end

When(/^I open contact to update$/) do
  click_link 'Редактировать'
end

When(/^I fill fields for contact and submit$/) do
  fill_in 'Имя церкви', :with => "some text"
  click_button 'Обновить'
end

# THEN

Then(/^I should see the map$/) do
  page.should have_css('div.map_container')
  page.should have_css('div.gmaps4rails_map')
end

Then(/^I should see message that contact has been updated$/) do
  page.should have_content "Контакты успешно обновлены!"
end