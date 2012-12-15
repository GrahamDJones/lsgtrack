And /^"(.*?)" has created a time entry for this ticket$/ do |email, table|
  table.hashes.each do |attributes|
    attributes = attributes.merge!(user: User.find_by_email!(email))
    time_entry = @ticket.time_entries.create!(attributes)
    time_entry.save
  end
end

And /^there are (\d+) time entries for this ticket$/ do |number|
  number.to_i.times do |i|
    @ticket.time_entries.create!(work_date: "2012-12-30", duration_minutes: 10, user: @user)
  end
end