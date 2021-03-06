admin_user = User.create(email: "admin@example.com", password: "password", name: "Admin User")
admin_user.admin = true
admin_user.confirm!

default_ticket_state = TicketState.create(name: "New", background: "#85FF00", color: "white")
default_ticket_state.default = true
default_ticket_state.save!
TicketState.create(name: "Open", background: "#00CFFD", color: "white")
TicketState.create(name: "Closed", background: "black", color: "white")

default_project_state = ProjectState.create(name: "Open", background: "#00CFFD", color: "white")
default_project_state.default = true
default_project_state.save!
ProjectState.create(name: "Closed", background: "black", color: "white", is_admin_only: true)

unless Rails.env.production?
  Project.create(name: "Time Tracker")
end