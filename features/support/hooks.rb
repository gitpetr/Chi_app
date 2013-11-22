Before('@selenium') do
  Capybara.javascript_driver = :selenium
end

After('@selenium') do
  Capybara.javascript_driver = :webkit
end

After('@javascript') do |scenario|
  screenshot_and_save_page if scenario.failed?
end