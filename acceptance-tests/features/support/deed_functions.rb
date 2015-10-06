def create_deed_data(case_id, deed_json)
  deed_json = JSON.parse(deed_json)
  deed_json['case_id'] = case_id
  response = HTTP.post(Env.deed_api + '/deed/', json: deed_json)
  if response.code == 200
    JSON.parse(response.body)['id']
  else
    fail "Error: Couldn't create deed #{deed_json}, "\
            "Received response #{response.code}"
  end
end

def get_deed_data(deed_id)
  response = HTTP.get(Env.deed_api + '/deed/' + deed_id.to_s)
  if response.code == 200
    JSON.parse(response.body)
  else
    fail "Error: Couldn't retrieve deed #{deed_id}, "\
            "Received response #{response.code}"
  end
end

def sign_deed_data(deed_id, borrower_id, borrower_name)
  payload = {
    'signature' => borrower_name
  }
  response = HTTP.post("#{Env.deed_api}/deed/#{deed_id}/"\
                      "#{borrower_id}/signature/", json: payload)
  if response.code == 200
    JSON.parse(response.body)
  else
    fail "Error: Couldn't sign deed #{deed_id}, "\
            "Received response #{response.code}"
  end
end

def delete_deed_data(deed_id)
  response = HTTP.delete(Env.deed_api + '/deed/' + deed_id.to_s)
  if response.code == 200
    puts "Deed #{deed_id} has been deleted."
  else
    fail "Error: Couldn't delete deed #{deed_id}, "\
            "received response #{response.code}."
  end
end
