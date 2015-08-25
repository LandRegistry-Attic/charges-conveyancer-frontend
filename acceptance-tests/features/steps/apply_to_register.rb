Given(/^all borrowers have signed the deed$/) do
  visit($BORROWER_FRONTEND_URL + '/deed/search')
  @deed = HTTP.get($DEED_API_URL + '/deed/' + @deed_id.to_s)
  @borrower_token =
  JSON.parse(@deed.body)['deed']['operative-deed']['borrowers'][0]['token']
  fill_in('borrower_token', with: @borrower_token)
  click_button('Search')
  click_button('Sign the deed')

  visit($BORROWER_FRONTEND_URL + '/deed/search')
  @deed = HTTP.get($DEED_API_URL + '/deed/' + @deed_id.to_s)
  @borrower_token =
  JSON.parse(@deed.body)['deed']['operative-deed']['borrowers'][1]['token']
  fill_in('borrower_token', with: @borrower_token)
  click_button('Search')
  click_button('Sign the deed')
end

And(/^conveyancer has made the deed effective$/) do
  step %(I navigate to the conveyancer frontend "/cases" page)
  click_link('Confirm completion')
  click_button('Confirm completion')
end

When(/^I select to Apply to register the deed$/) do
  find(:xpath, ".//*[@id='casework-dashboard']/tbody/tr[1]/td[6]/a").click
  click_button('Submit')
end

Then(/^the case status has changed to submitted$/) do
  step %(the status for the case is "([^"]*)"$/)
end
