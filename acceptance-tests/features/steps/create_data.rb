################################################################################
### This file contains steps for settting up case and deed data for the      ###
### acceptance tests prior to them running                                   ###
################################################################################

Given(/^I have created a case and deed with two borrowers$/) do
  @created_case_id = create_case_data

  path = File.expand_path('../../data/two_borrowers.json', __FILE__)
  borrower_json = File.read(path)
  @added_borrowers = add_borrowers_to_case(@created_case_id, borrower_json)

  path = File.expand_path('../../data/mortgage_property.json', __FILE__)
  property_json = File.read(path)
  @added_property = add_property_to_case(@created_case_id, property_json)

  path = File.expand_path('../../data/create_deed.json', __FILE__)
  deed_json = File.read(path)
  @created_deed_id = create_deed_data(@created_case_id, deed_json)

  update_case_deed(@created_deed_id, @created_case_id)
  ### Retrieve the created deed data to use later on in the scenario
  @created_deed = get_deed_data(@created_deed_id)
end

Given(/^I have created a case and deed with one borrower that is signed$/) do
  @created_case_id = create_case_data

  path = File.expand_path('../../data/one_borrower.json', __FILE__)
  borrower_json = File.read(path)
  @added_borrowers = add_borrowers_to_case(@created_case_id, borrower_json)

  path = File.expand_path('../../data/mortgage_property.json', __FILE__)
  property_json = File.read(path)
  @added_property = add_property_to_case(@created_case_id, property_json)

  path = File.expand_path('../../data/create_deed.json', __FILE__)
  deed_json = File.read(path)
  @created_deed_id = create_deed_data(@created_case_id, deed_json)

  update_case_deed(@created_deed_id, @created_case_id)
  ### Retrieve the created deed data to use later on in the scenario
  @created_deed = get_deed_data(@created_deed_id)
  ### Sign the deed with all of the borrowers
  @created_deed['deed']['operative-deed']['borrowers'].each do |borrower|
    sign_deed_data(@created_deed_id, borrower['id'], borrower['first_name'] +
                  ' ' + borrower['last_name'])
  end
end

Given(/^I have created a case and deed with two borrowers that is signed$/) do
  @created_case_id = create_case_data

  path = File.expand_path('../../data/two_borrowers.json', __FILE__)
  borrower_json = File.read(path)
  @added_borrowers = add_borrowers_to_case(@created_case_id, borrower_json)

  path = File.expand_path('../../data/mortgage_property.json', __FILE__)
  property_json = File.read(path)
  @added_property = add_property_to_case(@created_case_id, property_json)

  path = File.expand_path('../../data/create_deed.json', __FILE__)
  deed_json = File.read(path)
  @created_deed_id = create_deed_data(@created_case_id, deed_json)

  update_case_deed(@created_deed_id, @created_case_id)
  ### Retrieve the created deed data to use later on in the scenario
  @created_deed = get_deed_data(@created_deed_id)
  ### Sign the deed with all of the borrowers
  @created_deed['deed']['operative-deed']['borrowers'].each do |borrower|
    sign_deed_data(@created_deed_id, borrower['id'], borrower['first_name'] +
                  ' ' + borrower['last_name'])
  end
end
