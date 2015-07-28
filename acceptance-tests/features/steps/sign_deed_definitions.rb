Given(/^I have signed my mortgage deed as "([^"]*)"$/) do |name|
  steps %Q{
  Given I search for the created deed
  When I enter the borrowers signature "#{name}"
  And I click on the "Sign the deed" button
  }
end

When(/^I enter the borrowers signature "([^"]*)"$/) do |name|
  fill_in('borrowerName', with: name)
end
