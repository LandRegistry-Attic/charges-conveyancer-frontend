When(/^I search for the created deed using "([^"]*)"'s token$/) do |name|
  borrowers = @deed['deed']['operative-deed']['borrowers']
  this_borrower = borrowers.select { |borrower| borrower['name'] == name }[0]

  fill_in('borrower_token', with: this_borrower['token'])
  click_button('Search')
end
