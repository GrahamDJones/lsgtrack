Feature: Deleting projects
  In order to remove unwanted projects
  As a user
  I want to make them go away

  Scenario: Deleting a project
    Given there are the following users:
      | email             | password   | admin |
      | admin@example.com | password   | true  |
    And I am signed in as them
    Given there is a project called "Time Tracker"
    And I am on the homepage
    When I follow "Time Tracker"
    And I follow "Delete Project"
    Then I should see "Project has been deleted."
    And I should not see "Time Tracker"
