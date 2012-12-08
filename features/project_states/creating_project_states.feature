Feature: Creating project states
  In order to be able to specify other states for projects
  As an admin
  I want to add them to the application

  Background:
    Given there are the following users:
      | email             | password | admin |
      | admin@example.com | password | true  |
    And I am signed in as them

  Scenario: Creating a project state
    When I follow "Admin"
    And I follow "Project States"
    And I follow "New Project State"
    And I fill in "Name" with "Duplicate"
    And I fill in "Color" with "bisque"
    And I fill in "Background" with "springgreen"
    And I check "Admin only?"
    And I press "Create Project State"
    Then I should see "Project State has been created."

  Scenario: Creating a project state with missing name
    When I follow "Admin"
    And I follow "Project States"
    And I follow "New Project State"
    And I press "Create Project State"
    Then I should see "Project State has not been created."
    And I should see "Name can't be blank"

  Scenario: Color and background must be different
    When I follow "Admin"
    And I follow "Project States"
    And I follow "New Project State"
    And I fill in "Name" with "Duplicate"
    And I fill in "Color" with "white"
    And I fill in "Background" with "white"
    And I press "Create Project State"
    Then I should see "Project State has not been created."
    And I should see "Colors must not be the same"
