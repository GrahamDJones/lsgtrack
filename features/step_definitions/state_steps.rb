Given /^there is a ticket state called "(.*?)"$/ do |name|
  TicketState.create!(name: name, color: "white", background: "green")
end

Given /^there is a default ticket state called "(.*?)"$/ do |name|
  ticket_state = TicketState.create!(name: name, color: "white", background: "green")
  ticket_state.default!
  ticket_state.save!
end

And /^I follow "(.*?)" for the "(.*?)" ticket state$/ do |link, name|
  ticket_state = TicketState.find_by_name!(name)
  steps(%Q{When I follow "#{link}" within "#ticket state_#{ticket_state.id}"})
end