Feature: Creating projects
  In order to have projects to assign tickets to
  As a user
  I want to create them easily

  Background:
    Given there is a default project state called "Open"
    Given there are the following users:
    | email             | password   | admin |
    | admin@example.com | password   | true  |
    And I am signed in as them
    Given I am on the home page
    When I follow "New Project"

  Scenario: Creating a project
    And I fill in "Name" with "Time Tracker"
    And I press "Create Project"
    Then I should see "Project has been created."
    And I should be on the project page for "Time Tracker"
    And I should see "Time Tracker - Projects - LSG Tracker"
    And I should see "Open" within ".state"

  Scenario: Creating a project without a name
    And I press "Create Project"
    Then I should see "Project has not been created."
    And I should see "Name can't be blank"