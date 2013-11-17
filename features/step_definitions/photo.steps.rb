# GIVEN

Given(/^There is album with photos for slideshow$/) do
  @slideshow_album = FactoryGirl.create( :album )
  @slide_photo1_text = "my super text1"
  @slide_photo2_text = "my super text2"

  FactoryGirl.create( :photo, :description => @slide_photo1_text, :album => @slideshow_album )
  FactoryGirl.create( :photo,
                      :album       => @slideshow_album,
                      :description => @slide_photo2_text,
                      :image => File.open(File.join( Rails.root, '/spec/fixtures/files/cello.jpg' )))
end

Given(/^I go to page with albums$/) do
  visit root_path(:locale => :ru)
  click_link "navbar-albums"
end

# WHEN

When(/^I open an album$/) do
  click_link "album-#{@slideshow_album.id}"
end

When(/^I click image$/) do
  first(:css, 'img.photo').click                                                                  # Find the first one image and click it.
end

When(/^I close modal window$/) do
  click_button "×"
end

# THEN

Then(/^I should see that modal with slideshow opened$/) do
  page.should have_selector('h3', :text => 'Слайды')
end

Then(/^I should see text of one image$/) do
  page.should have_selector('p', :text => @slide_photo2_text)
end

Then(/^I should see text of next image$/) do
  page.should have_selector('p', :text => @slide_photo1_text)
end

Then(/^I should see that modal with slideshow is hidden$/) do
  page.should_not have_selector('h3', :text => 'Слайды')
end