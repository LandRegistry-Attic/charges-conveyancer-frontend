Given(/^I navigate to the case list page$/) do
  visit("#{$CHARGES_URL}/cases")
end

Then(/^the case reference number is displayed$/) do
  page.find(:css, '.casework-dashboard tr', :text => 'FGHIK987')
end

Then(/^the client is displayed$/) do
  find_data_in_table_row('.casework-dashboard', 'FGHIK987', 'David Stephens')
  find_data_in_table_row('.casework-dashboard', 'FGHIK987', 'Maria Stephens')
end

Then(/^the task is displayed$/) do
  find_data_in_table_row('.casework-dashboard', 'FGHIK987', 'Remortgage')
end

Then(/^the status is displayed$/) do
  find_data_in_table_row('.casework-dashboard', 'FGHIK987', 'Mortgage deed created')
end

Then(/^the last updated date is displayed$/) do
  find_data_in_table_row('.casework-dashboard', 'FGHIK987', '2 March 2015')
end

Then(/^the case list is sorted by last updated date$/) do
  ### Retrieve all dates in the table assuming that the dates
  ### are contained in the fifth column of the table
  dates = page.all(:css, '.casework-dashboard tr td:nth-child(5)')
  ### Check each set of two consecutive dates are same or in descending order
  datesDescending = dates.each_cons(2).all? { |firstDate, secondDate|
    (Date.parse(firstDate.text) <=> Date.parse(secondDate.text)) >= 0
  }
  assert_equal(true, datesDescending)
end
