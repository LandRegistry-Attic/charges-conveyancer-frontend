Given(/^I have created a new case$/) do
  step %(I navigate to the conveyancer frontend "/cases" page)
  step %(I click on the "Create a new case" link)
  click_button('Create case')
end

When(/^I select to add a property to the case$/) do
  click_link('Add property')
end

And(/^I enter a title number$/) do
  fill_in('Title number', with: 'LO3827')
  click_button('Search')
end

Then(/^the correct address details are displayed$/) do
  page.should have_content('Title number: LO3827')
  page.should have_content('42A Broad Street')
  page.should have_content('Market Square')
  page.should have_content('Slough')
  page.should have_content('SL2 1TP')
  page.should have_content('Tenure: freehold')
end

When(/^select the returned property$/) do
  click_button('Select this property')
end

And(/^the add title number button is no longer available$/) do
  page.should have_no_content('Add property')
end

And(/^I enter an invalid title number$/) do
  fill_in('Title number', with: 'AA3827')
  click_button('Search')
end

Then(/^an invalid Title Number error message is displayed to the user$/) do
  page.should have_content('Title number not found. Please check and try again')
end

And(/^the selected property address details are re\-displayed$/) do
  page.should have_content('Title number: LO3827')
  page.should have_content('Market Square')
  page.should have_content('42A Broad Street')
  page.should have_content('Slough')
  page.should have_content('SL2 1TP')
end
