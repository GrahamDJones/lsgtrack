Feature: Creating Users
  In order to add new users to the system
  As and admin
  I want to add them using a form

Background:
  Given there are the following users:
    | email             | password | admin |
    | admin@example.com | password | true  |
  And I am signed in as them
  Given I am on the homepage
  When I follow "Admin"
  And I follow "Users"
  When I follow "New User"

  Scenario: Creating a new user
    And I fill in "Email" with "newbie@example.com"
    And I fill in "Password" with "password"
    And I press "Create User"
    Then I should see "User has been created."

  Scenario: User must have an email
    And I fill in "Email" with ""
    And I fill in "Password" with "password"
    And I press "Create User"
    Then I should see "User has not been created."
    And I should see "Email can't be blank"
