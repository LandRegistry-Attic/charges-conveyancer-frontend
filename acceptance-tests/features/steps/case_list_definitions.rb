require 'date'
require 'net/http'
require 'uri'
require 'json'

$cases_to_add = 3
$table_row_selector = 'table#casework-dashboard tbody tr'

$json_objects = []
$origin_number_of_table_rows = 0

Given(/^I view the case list$/) do
  step %(I navigate to the conveyancer frontend "/cases" page)
  $origin_number_of_table_rows = page.all(:css, $table_row_selector).length
end

When(/^I click on the Confirm completion link$/) do
  find(:css, 'tr.summary.case-' + @case_id.to_s + ' > td > a').click
end

And(/^I have added values to the case_api$/) do
  (1..$cases_to_add).each do
    # generate completely random case data
    case_json = {
      deed_id: rand(1..999_999_999),
      conveyancer_id: rand(1..999_999_999)
    }.to_json

    uri = URI.parse($CASE_API_URL + '/case')

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    request.body = case_json
    request['Content-Type'] = 'application/json'

    response = http.request(request)

    if response.code == '200' || response.code == '201'
      $json_objects.push(JSON.parse(response.body))
    end
  end
end

Then(/^check if it has more or equal the number of rows I added$/) do
  rows = page.all(:css, $table_row_selector)
  assert_equal(rows.length, $cases_to_add + $origin_number_of_table_rows)
end

Then(/^the case list is sorted by last updated date$/) do
  ### Retrieve all dates in the table assuming that the dates
  ### are contained in the fifth column of the table
  dates = page.all(:css, $table_row_selector + ' td:nth-child(5)')
  ### Check each set of two consecutive dates are same or in descending order
  dates_descending = dates.each_cons(2).all? do |first_date, second_date|
    (Date.parse(first_date.text) <=> Date.parse(second_date.text)) >= 0
  end
  assert_equal(true, dates_descending)
end

Then(/^check if it has the rows I added$/) do
  $json_objects.each do |json_object|
    page.has_selector?(:css, ".case-#{json_object['id']}", count: 1)
    page.has_content?(json_object['status'].to_s)
    page.has_content?(json_object['last_updated'].to_s)
  end
end

Then(/^I cleanup the case_api$/) do
  $json_objects.each do |json_object|
    uri = URI.parse("#{$CASE_API_URL}/case/#{json_object['id']}")

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Delete.new(uri.request_uri)

    http.request(request)
  end
end

Then(/^the status for the case is "([^"]*)"$/) do |status|
  case_status = find(:xpath,
                     '//*[@id="casework-dashboard"]/tbody/tr[1]/td[4]').text
  assert_equal(status, case_status)
end

Then(/^the reference "([^"]*)" is displayed in the case list$/) do |reference|
  case_reference = find(:xpath,
                        '//*[@id="casework-dashboard"]/tbody/tr[1]/td[1]').text
  assert_equal(reference, case_reference)
end

Then(/^no reference is displayed in the case list$/) do
  case_reference = find(:xpath,
                        '//*[@id="casework-dashboard"]/tbody/tr[1]/td[1]').text
  assert_equal('', case_reference)
end

Then(/^no new case has been created$/) do
  case_list_rows = page.all(:css, $table_row_selector)
  assert_equal(case_list_rows.length, $origin_number_of_table_rows)
end
