Feature: Editing a user
  In order to change a uer's details
  As and admin
  I want to modify them thru the backend

Background:
  Given there are the following users:
    | email             | password | admin  |
    | admin@example.com | password | true   |
    | user@example.com  | password | false  |
  And I am signed in as "admin@example.com"
  Given I am on the homepage
  When I follow "Admin"
  And I follow "Users"
  And I follow "user@example.com"
  And I follow "Edit User"

  Scenario: Update a user's name
    When I fill in "Name" with "New Name"
    And I press "Update User"
    Then I should see "User has been updated."
    And I should see "New Name"
    And I should see "user@example.com"

  Scenario: Update a user's email
    When I fill in "Email" with "new.email@example.com"
    And I press "Update User"
    Then I should see "User has been updated."
    And I should see "new.email@example.com"

  Scenario: Toggle a user's admin ability
    When I check "Is an admin?"
    And I press "Update User"
    Then I should see "User has been updated."
    And I should see "user@example.com"
    And I should see "Admin"

  Scenario: Update with invalid email fails
    When I fill in "Email" with "fakefakefake"
    And I press "Update User"
    Then I should see "User has not been updated."
    And I should see "Email is invalid"
