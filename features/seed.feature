Feature: Seed data
  In order to fill the db with the basics
  As the system
  I want to run the seed task

Scenario: The basics
  Given I have run the seed task
  And I am signed in as "admin@example.com"
  Then I should see "LSG Tracker"
  And I should see "Time Tracker"