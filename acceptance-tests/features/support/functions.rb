def find_data_in_table_row(table_row_id, unique_value, dataValue)
  ### Retrieve the contents of the specified row
  row = page.find(:css, table_row_id, text: unique_value).text
  ### Check supplied data value is present in the table row and return result
  assertion = row.include? dataValue
  assert_equal(true, assertion)
end
