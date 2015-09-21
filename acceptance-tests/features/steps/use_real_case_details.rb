When(/^I retrieve the deed$/) do
  @retrieved_deed = get_deed_data(@created_deed_id)
end

Then(/^the correct borrower details are returned$/) do
  assert_equal(@added_borrower, @added_borrower)
  puts @added_borrower
end

And(/^the correct property details are returned$/) do
  assert_equal(@mortgage_property, @mortgage_property)
  puts @mortgage_property
end
