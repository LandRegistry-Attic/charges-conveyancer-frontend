################################################################################
### Navigating through the frontend steps                                    ###
################################################################################

Given(/^I navigate to the conveyancer frontend "([^"]*)" page$/) do |path|
  visit(Env.conveyancer_frontend + path)
end

Given(/^I navigate to the borrower frontend "([^"]*)" page$/) do |path|
  visit(Env.borrower_frontend + path)
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

################################################################################
### Checking page contents                                                   ###
################################################################################

Then(/^the "([^"]*)" page is displayed$/) do |page_title|
  page.has_selector?(:css, 'h1', text: page_title)
end

Then(/^a message is displayed stating you didnt enter "([^"]*)"$/) do |field|
  if field == 'Email address'
    expect(page).to have_content('You have to enter correct ' + field)
  else
    expect(page).to have_content('You have to enter ' + field)
  end
end
