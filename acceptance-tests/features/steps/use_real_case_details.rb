When(/^I retrieve the deed$/) do
  @retrieved_deed = get_deed_data(@created_deed_id)
end

Then(/^the correct borrower details are returned$/) do
  @retrieved_borrowers = @retrieved_deed['deed']['operative-deed']['borrowers']
  @added_borrowers.zip(@retrieved_borrowers).each do |added, retrieved|
    assert_equal(added['first_name'], retrieved['first_name'])
    assert_equal(added['middle_names'],
                 retrieved['middle_names'])
    assert_equal(added['last_name'], retrieved['last_name'])
    assert_equal(added['address'], retrieved['address'])
    assert_equal(added['email_address'],
                 retrieved['email_address'])
    assert_equal(added['mobile_no'], retrieved['mobile_no'])
  end
end

And(/^the correct property details are returned$/) do
  @retrieved_property = @retrieved_deed['deed']['operative-deed']['title']
  assert_equal(@added_property['title_number'],
               @retrieved_property['title-number'])
  assert_equal(@added_property['street'],
               @retrieved_property['address']['street-address'])
  assert_equal(@added_property['extended'],
               @retrieved_property['address']['extended-address'])
  assert_equal(@added_property['locality'],
               @retrieved_property['address']['locality'])
  assert_equal(@added_property['postcode'],
               @retrieved_property['address']['postal-code'])
end
