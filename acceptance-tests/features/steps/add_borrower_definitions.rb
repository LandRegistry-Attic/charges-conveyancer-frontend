################################################################################
### Below are staircase steps, that perform basic functions for this part of ###
### the project but are wrapped up in a more meaningful and concise name     ###
################################################################################

When(/^I add the following borrowers to a case:$/) do |borrowers|
  @borrowers = borrowers.hashes
  @borrowers.each do |borrower|
    step %(I click on the "Add borrower" link)
    step %(I enter "#{borrower['FIRST NAME']}" into the "first_name" field)
    step %(I enter "#{borrower['MIDDLE NAME']}" into the "middle_names" field)
    step %(I enter "#{borrower['LAST NAME']}" into the "last_name" field)
    step %(I enter "#{borrower['STREET ADDRESS']}" ) +
      %(into the "street_address" field)
    step %(I enter "#{borrower['EXTENDED ADDRESS']}" ) +
      %(into the "extended_address" field)
    step %(I enter "#{borrower['LOCALITY']}" into the "locality" field)
    step %(I enter "#{borrower['POSTCODE']}" into the "postcode" field)
    step %(I enter "#{borrower['MOBILE NUMBER']}}" into the "mobile_no" field)
    step %(I enter "#{borrower['EMAIL ADDRESS']}" ) +
      %(into the "email_address" field)
    step %(I click on the "Add borrower" button)
  end
end

################################################################################
### Below are the main bulk of the step definitions for this part of the     ###
### project                                                                  ###
################################################################################

Then(/^all of a borrowers details can be entered$/) do
  page.has_field?('first_name', type: 'text')
  page.has_field?('middle_names', type: 'text')
  page.has_field?('last_name', type: 'text')
  page.has_field?('street_address', type: 'text')
  page.has_field?('extended_address', type: 'text')
  page.has_field?('locality', type: 'text')
  page.has_field?('postcode', type: 'text')
  page.has_field?('mobile_no', type: 'text')
  page.has_field?('email_address', type: 'email')
end

Then(/^the borrowers details are displayed$/) do
  @borrowers.each do |borrower|
    borrower.each do |_key, value|
      page.has_content?(value)
    end
  end
end

When(
  /^I fill in all borrower details except for "([^"]*)"$/
) do |mandatory_field|
  borrower_hash = {
    'first_name' => 'Sarah',
    'middle_names' => 'Jane',
    'last_name' => 'Smith',
    'street_address' => '83 Lordship Park',
    'locality' => 'London',
    'postcode' => 'N16 5UT',
    'mobile_no' => '01662364545',
    'email_address' => 'sjsmith@gmail.com'
  }
  borrower_hash.each do |field, value|
    if field != mandatory_field
      step %(I enter "#{value}" into the "#{field}" field)
    end
  end
end
