require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "factories"))

And /^"(.*?)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    attributes = attributes.merge!(user: User.find_by_email!(email))
    @project.tickets.create!(attributes)
  end
end
