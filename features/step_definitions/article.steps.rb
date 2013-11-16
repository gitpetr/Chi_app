# GIVEN

Given(/^I have an article$/) do
  @article = FactoryGirl.create( :article )
end

# WHEN

When(/^I go to page with articles$/) do
  page.find("#navbar-articles").click
end

When(/^I fill article's fields and submit$/) do
  click_link "Новая статья"
  fill_in "Заголовок",  :with => "random text"
  fill_in "Текст статьи",  :with => "random text"
  click_button "Создать"
end

When(/^I open an article$/) do
  click_link "Изменить"
  click_link "Редактировать"
end

When(/^I update article's fields and then submit$/) do
  fill_in "Заголовок",  :with => "random text"
  fill_in "Текст статьи",  :with => "random text"
  click_button "Обновить"
end

When(/^I delete the article$/) do
  click_link "Изменить"
  click_link "Удалить"
  click_link "destroy_link"                                                                     # Click delete link in window via id.
end

# THEN

Then(/^I should see message that article has been created$/) do
  page.should have_content "Статья была успешно создана!"
end

Then(/^I should see message that article has been updated$/) do
  page.should have_content "Статья была успешно обновлена!"
end

Then(/^I should see message that article has been deleted$/) do
  page.should have_content "Статья была успешно удалена!"
end

