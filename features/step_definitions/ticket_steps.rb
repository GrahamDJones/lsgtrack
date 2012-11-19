require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "factories"))

And /^that project has a ticket:$/ do |table|
  table.hashes.each do |attributes|
    @project.tickets.create!(attributes)
  end
end
