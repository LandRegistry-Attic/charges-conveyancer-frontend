#THIS DATA SETUP WILL CARRY OUT THE FOLLOWING DATA SETUP:
#2 BORROWERS, MORTGAGE PROPERTY, CREATE DEED AND ASSOCIATE DEED TO CASE

Given(/^I have created a case and deed with two borrowers$/) do
@created_case_id = create_case_data

file = File.read('./features/data/two_borrowers.json')
@added_borrower = JSON.parse(file)
add_borrowers_to_case(@created_case_id, @added_borrower)

file = File.read('./features/data/add_mortgage_property.json')
@mortgage_property = JSON.parse(file)
add_property_to_case(@created_case_id, @mortgage_property)

file = File.read('./features/data/create_deed.json')
@mortgage_property = JSON.parse(file)
@created_deed_id = create_deed_data(@mortgage_property)

update_case_deed(@created_deed_id, @created_case_id)
end
