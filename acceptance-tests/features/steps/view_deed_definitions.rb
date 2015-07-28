When(/^I search for the created deed$/) do
  fill_in('deedRefNumber', with: @deed_id)
  click_button('Search')
end
