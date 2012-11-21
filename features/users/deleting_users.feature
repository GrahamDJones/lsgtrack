Feature: Deleting Users
  In order to remove users
  As an Admin
  I want to click a button to remove them

Background:
  Given there are the following users:
    | email             | password | admin  |
    | admin@example.com | password | true   |
    | user@example.com  | password | false  |
  And I am signed in as "admin@example.com"
  Given I am on the homepage
  When I follow "Admin"
  And I follow "Users"

  Scenario: Deleting a user
    And I follow "user@example.com"
    When I follow "Delete User"
    Then I should see "User has been deleted."

  Scenario: Users can not delete themselves
    And I follow "admin@example.com"
    When I follow "Delete User"
    Then I should see "You cannot delete yourself!"
