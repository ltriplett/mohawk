When /^we are observing the people table$/ do
  on(MainScreen).data_entry_form_button
  on(DataEntryForm).should be_active
end

Then /^the table row information should look like the following:$/ do |row_items|
  row_items.map_column!("row") { |r| r.to_i }
  row_items.map_headers!("text" => :text, "row" => :row)
  on(DataEntryForm).people_rows.should eq row_items.hashes
end

When /^we select the table row with index "(.*?)"$/ do |row_index|
  on(DataEntryForm).people = row_index.to_i
end

Then /^the row with index "(.*?)" should be selected$/ do |which_row|
  on(DataEntryForm).people_row(which_row.to_i).should be_selected
end
