Given(/^I have signed my mortgage deed as "([^"]*)"$/) do |name|
  step %(I search for the created deed)
  step %(I enter the borrowers signature "#{name}")
  step %(I click on the "Sign the deed" button)
end

When(/^I enter the borrowers signature "([^"]*)"$/) do |name|
  fill_in('borrowerName', with: name)
end
