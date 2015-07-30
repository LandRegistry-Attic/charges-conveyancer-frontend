Then(/^I am taken to the '([^']*)' page$/) do |title|
  page.find(:css, 'h1', text: title)
end

Given(/^I am on the Create a new case page$/) do
  step 'I navigate to the case list page'
  @case_row = 'table#casework-dashboard tbody tr'
  @number_of_cases = page.all(:css, @case_row).length
  step %(I click on the "Create a new case" link)
  step "I am taken to the 'Create a new case' page"
end

When(/^I enter the case reference "([^"]*)"$/) do |reference|
  fill_in('caseReference', with: reference)
end

When(/^I leave the case reference field blank$/) do
end

Then(/^a new case has been added to the case list$/) do
  page.has_selector?(:css, @case_row, count: @number_of_cases + 1)
end
