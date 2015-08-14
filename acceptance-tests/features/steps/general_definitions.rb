################################################################################
### Setting up data steps and test preparation steps                         ###
################################################################################

Given(/^the conveyancer has created the following deed:$/) do |deed_json|
  @deed_id = create_deed_data(deed_json)
  @deed = get_deed(@deed_id)
end

Given(/^the conveyancer has created a case that is linked to a deed$/) do
  @case_id = create_case_data
  update_case_with_deed_id
end

################################################################################
### Navigating through the frontend steps                                    ###
################################################################################

Given(/^I navigate to the conveyancer frontend "([^"]*)" page$/) do |path|
  visit($CHARGES_URL + path)
end

Given(/^I navigate to the borrower frontend "([^"]*)" page$/) do |path|
  visit($BORROWER_FRONTEND_URL + path)
end

Then(/^the "([^"]*)" page is displayed$/) do |page_title|
  page.has_selector?(:css, 'h1', text: page_title)
end

################################################################################
### Page interaction steps                                                   ###
################################################################################

When(/^I click on the "([^"]*)" button$/) do |button_name|
  click_button(button_name)
end

When(/^I click on the "([^"]*)" link$/) do |link_name|
  click_link(link_name)
end

When(/^I enter "([^"]*)" into the "([^"]*)" field$/) do |value, field|
  fill_in(field, with: value)
end
