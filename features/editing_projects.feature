Feature: Editing projects
  In order to update project information
  As a user
  I want to be able to do that thru an interface

  Background:
    Given there is a project called "Time Tracker"
    And I am on the homepage
    When I follow "Time Tracker"
    And I follow "Edit Project"

  Scenario: Updating a project
    And I fill in "Name" with "Time Tracker 2"
    And I press "Update Project"
    Then I should see "Project has been updated."
    And I should be on the project page for "Time Tracker 2"

  Scenario: Update project with blank name
    And I fill in "Name" with ""
    And I press "Update Project"
    Then I should see "Project has not been updated."

