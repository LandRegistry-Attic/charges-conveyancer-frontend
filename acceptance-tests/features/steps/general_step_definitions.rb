Given(/^I navigate to the conveyancer frontend "([^"]*)" page$/) do |path|
  visit($CHARGES_URL + path)
end

When(/^I click on the "([^"]*)" button$/) do |button_name|
  click_button(button_name)
end

Then(/^the "([^"]*)" page is displayed$/) do |page_title|
  page.has_content?(page_title)
end
