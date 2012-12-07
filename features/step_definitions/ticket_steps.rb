require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "factories"))

And /^"(.*?)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    tags = attributes.delete("tags")
    ticket_state = attributes.delete("state")
    attributes = attributes.merge!(user: User.find_by_email!(email))
    ticket = @project.tickets.create!(attributes)
    ticket.state = TicketState.find_or_create_by_name(ticket_state) if ticket_state
    ticket.tag!(tags) if tags
    ticket.save
  end
end

And /^there are (\d+) tickets for this project$/ do |number|
  number.to_i.times do |i|
    @project.tickets.create!(title: "Text", description: "Placeholder ticket", user: @user)
  end
end

And /^there should be (\d+) watchers$/ do |number|
  pages = all("#awatcher")
  pages.count.should eql(number.to_i)
end


