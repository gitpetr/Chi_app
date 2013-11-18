Before('@selenium') do
  Capybara.javascript_driver = :selenium
end

After('@selenium') do
  Capybara.javascript_driver = :webkit
end