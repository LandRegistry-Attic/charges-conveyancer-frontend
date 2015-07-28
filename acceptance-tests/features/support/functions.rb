def find_data_in_table_row(table_row_id, unique_value, dataValue)
  ### Retrieve the contents of the specified row
  row = page.find(:css, table_row_id, text: unique_value).text
  ### Check supplied data value is present in the table row and return result
  assertion = row.include? dataValue
  assert_equal(true, assertion)
end

def create_deed_data(deed_json)
  deed_json = JSON.parse(deed_json)
  response = HTTP.post($DEED_API_URL + '/deed/', json: deed_json)
  if response.code == 200
    JSON.parse(response.body)['id']
  else
    fail "Error: Couldn't create deed #{deed_json}, "\
            "Received response #{response.code}"
  end
end

def delete_deed_data(deed_id)
  response = HTTP.delete($DEED_API_URL + '/deed/' + deed_id.to_s)
  if response.code == 200
    puts "Deed #{deed_id} has been deleted."
  else
    fail "Error: Couldn't delete deed #{deed_id}, "\
            "received response #{response.code}."
  end
end

def create_case_data
  case_json = {
    'deed_id' => @deed_id,
    'conveyancer_id' => '1'
  }
  response = HTTP.post($CASE_API_URL + '/case', json: case_json)
  if response.code == 201
    JSON.parse(response.body)['id']
  else
    fail "Error: Couldn't create case #{case_json}, "\
            "Received response #{response.code}"
  end
end

def delete_case_data(case_id)
  response = HTTP.delete($CASE_API_URL + '/case/' + case_id.to_s)
  if response.code == 200
    puts "Case #{case_id} has been deleted."
  else
    fail "Error: Couldn't delete case #{case_id}, "\
            "received response #{response.code}."
  end
end
