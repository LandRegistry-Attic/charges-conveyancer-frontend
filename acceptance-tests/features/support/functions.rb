def find_data_in_table_row(tableID, rowID, dataValue)
  ### Retrieve the contents of the specified row
  row = page.find(:css, tableID + ' tr', text: rowID).text
  ### Check supplied data value is present in the table row and return result
  assertion = row.include? dataValue
  assert_equal(true, assertion)
end
