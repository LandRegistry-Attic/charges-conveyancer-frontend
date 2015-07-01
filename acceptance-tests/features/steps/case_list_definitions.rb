require 'date'
require 'net/http'
require 'uri'
require 'json'

$cases_to_add = 3
$table_row_selector = 'table#casework-dashboard tbody tr'

$json_objects = []
$origin_number_of_table_rows = 0

Given(/^I know how many items are originally in the list$/) do
  visit $CHARGES_URL + '/cases'
  $origin_number_of_table_rows = page.all(:css, $table_row_selector).length
end

Given(/^I have added values to the case_api$/) do
  (1..$cases_to_add).each do
    # generate completely random case data
    case_json = {
      id: rand(1..999_999_999),
      deed_id: rand(1..999_999_999),
      conveyancer_id: rand(1..999_999_999),
      status: (0...50).map { ('a'..'z').to_a[rand(26)] }.join,
      last_updated:  Time.at(0.00 + rand * (0.00 - Time.now.to_f)),
      created_on:  Time.at(0.00 + rand * (0.00 - Time.now.to_f))
    }.to_json

    uri = URI.parse($CASE_API_URL + '/case')

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    request.body = case_json
    request['Content-Type'] = 'application/json'

    response = http.request(request)

    if response.code == '200' || response.code == '201'
      $json_objects.push(case_json)
    end
  end
end

When(/^I navigate to the case list page$/) do
  visit $CHARGES_URL + '/cases'
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
  items_found = 0
  is_present = false

  $json_objects.each do |json_object|
    json_ruby_object = JSON.parse(json_object)
    json_ruby_object['last_updated'] =
      DateTime.parse(json_ruby_object['last_updated'].to_s)
      .strftime('%d/%m/%Y')

    is_present =  page.has_content?(json_ruby_object['status'].to_s) &&
                  page.has_content?(json_ruby_object['last_updated'].to_s)

    if is_present == true
      items_found += 1
      is_present = false
    end
  end
  assert_equal($cases_to_add, items_found)
end

Then(/^I cleanup the case_api$/) do
  $json_objects.each do |json_object|
    uri = URI.parse($CASE_API_URL + '/case/' +
                    JSON.parse(json_object)['id'].to_s)

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Delete.new(uri.request_uri)

    http.request(request)
  end
end
