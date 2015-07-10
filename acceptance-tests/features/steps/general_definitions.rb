Given(/^I navigate to the conveyancer frontend "([^"]*)" page$/) do |path|
  visit($CHARGES_URL + path)
end

When(/^I click on the "([^"]*)" link$/) do |link_name|
  click_link(link_name)
end

Then(/^the "([^"]*)" page is displayed$/) do |page_title|
   expect(page).to have_content(page_title)
end
