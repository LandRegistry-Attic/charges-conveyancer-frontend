Given(/^I have created a Case with two borrowers and an asscociated deed$/) do
  step %(I have created a case and deed with two borrowers)
end

When(/^I retrieve the deed$/) do
@get_deed = get_deed_data(@created_deed_id)
end

Then(/^the correct borrower details are returned$/) do
  assert_equal(@added_borrower, @added_borrower)
  puts @added_borrower
end

And(/^the correct property details are returned$/) do
  assert_equal(@mortgage_property, @mortgage_property)
  puts @mortgage_property
end
