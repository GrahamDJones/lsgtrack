Feature: Viewing projects
  In order to assign tickets to a project
  As a user
  I want to be able to see a list of available projects

  Scenario:
    Given there is a project called "Time Tracker"
    And I am on the homepage
    When I follow "Time Tracker"
    Then I should be on the project page for "Time Tracker"
