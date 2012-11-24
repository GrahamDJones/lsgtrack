admin_user = User.create(email: "admin@example.com", password: "password")
admin_user.admin = true
admin_user.confirm!
State.create(:name => "New",
             :background => "#85FF00",
             :color => "white")
State.create(:name => "Open",
             :background => "#00CFFD",
             :color => "white")
State.create(:name => "Closed",
             :background => "black",
             :color => "white")

unless Rails.env.production?
  Project.create(name: "Time Tracker")
end