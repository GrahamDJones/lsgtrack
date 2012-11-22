admin_user = User.create(email: "admin@example.com", password: "password")
admin_user.admin = true
admin_user.confirm!

unless Rails.env.production?
  Project.create(name: "Time Tracker")
end