Feature: Editing project states
  In order to alter project state information
As an admin
I want to be able to alter project state attributes

Background:
  Given I have run the seed task
  And I am signed in as "admin@example.com"
  Given I am on the homepage
  When I follow "Admin"
  And I follow "Project States"
  And I follow "Edit" within "#access_state_open"

  Scenario: Updating a project state with valid attributes
    And I fill in "Name" with "Different"
    And I fill in "Color" with "bisque"
    And I fill in "Background" with "yellow"
    And I press "Update Project State"
    Then I should see "Project State has been updated."

  Scenario: Updating a project state with missing name
    And I fill in "Name" with ""
    And I press "Update Project State"
    Then I should see "Project State has not been updated."

  Scenario: Updating a project state with duplicate colors
    And I fill in "Color" with "bisque"
    And I fill in "Background" with "bisque"
    And I press "Update Project State"
    Then I should see "Project State has not been updated."
