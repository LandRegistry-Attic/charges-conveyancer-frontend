When(/^I search for the created deed using "([^"]*)"'s token$/) do |name|
  borrowers = @created_deed['deed']['operative-deed']['borrowers']
  this_borrower = borrowers.select { |borrower| borrower['name'] == name }
  fill_in('borrower_token', with: this_borrower[0]['token'])
  click_button('Search')
end
