Feature: Seed data
  In order to fill the db with the basics
  As the system
  I want to run the seed task

Scenario: The basics
  Given I have run the seed task
  And I am signed in as "admin@example.com"
  Then I should see "LSG Tracker"
  And I should see "Time Tracker"
  When I follow "Time Tracker"
  And I follow "New Ticket"
  And I fill in "Title" with "Comments with state"
  And I fill in "Description" with "comments always have a state"
  And I press "Create Ticket"
  Then I should see "New" within "#comment_state_id"
  And I should see "Open" within "#comment_state_id"
  And I should see "Closed" within "#comment_state_id"