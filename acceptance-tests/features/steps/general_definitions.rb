Given(/^I navigate to the conveyancer frontend "([^"]*)" page$/) do |path|
  visit($CHARGES_URL + path)
end

When(/^I click on the "([^"]*)" link$/) do |link_name|
  click_link(link_name)
end

Then(/^the "([^"]*)" page is displayed$/) do |page_title|
  page.has_selector?(:css, 'h1', text: page_title)
end

Given(/^I navigate to the borrower frontend "([^"]*)" page$/) do |path|
  visit($BORROWER_FRONTEND_URL + path)
end

Given(/^the conveyancer has created the following deed:$/) do |deed_json|
  @deed_id = create_deed_data(deed_json)
  @deed = get_deed(@deed_id)
end

When(/^I click on the "([^"]*)" button$/) do |button_name|
  click_button(button_name)
end

Given(/^the conveyancer has created a case$/) do
  @case_id = create_case_data
end
