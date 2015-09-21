When(/^I search for the created deed using "([^"]*) ([^"]*)"'s token$/) do |first_name, last_name|
  borrowers = @created_deed['deed']['operative-deed']['borrowers']
  this_borrower = borrowers.select { |borrower| borrower['first_name'] == first_name && borrower['last_name'] == last_name }

  fill_in('borrower_token', with: this_borrower[0]['token'])
  click_button('Search')
end
