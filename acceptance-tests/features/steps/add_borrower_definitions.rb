################################################################################
### Below are staircase steps, that perform basic functions for this part of ###
### the project but are wrapped up in a more meaningful and concise name     ###
################################################################################

When(/^I add the following borrower to a case:$/) do |borrowers|
  borrowers.hashes.each do |borrower|
    step %(I click on the "Add a borrower to this case" link)
    step %(I enter "#{first name}" into the "first-name" field)
    step %(I enter "#{middle name}" into the "middle-name" field)
    step %(I enter "#{last name}" into the "last-name" field)
    step %(I enter "#{address}" into the "address" field)
    step %(I enter "#{mobile number}" into the "mobile-number" field)
    step %(I enter "#{email address}" into the "email-address" field)
    step %(I click on the "Add borrower to case" button)
  end
end

################################################################################
### Below are the main bulk of the step definitions for this part of the     ###
### project                                                                  ###
################################################################################

Then(/^all of a borrowers details can be entered$/) do
  page.has_field?('First Name', type: 'text')
  page.has_field?('Middle Name', type: 'text')
  page.has_field?('Last Name', type: 'text')
  page.has_field?('Address', type: 'text')
  page.has_field?('Mobile Number', type: 'text')
  page.has_field?('Email Address', type: 'email')
end
