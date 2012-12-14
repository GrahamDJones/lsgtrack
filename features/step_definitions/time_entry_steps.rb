And /^"(.*?)" has created a time entry for this ticket$/ do |email, table|
  table.hashes.each do |attributes|
    attributes = attributes.merge!(user: User.find_by_email!(email))
    time_entry = @ticket.time_entries.create!(attributes)
    time_entry.save
  end
end