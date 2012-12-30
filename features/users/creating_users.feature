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
    And I fill in "Name" with "User Name"
    And I press "Create User"
    Then I should see "User has been created."
    And I should see "User Name"

  Scenario: Creating a new user name defaults to email
    And I fill in "Email" with "newbie@example.com"
    And I fill in "Password" with "password"
    And I press "Create User"
    Then I should see "User has been created."
    And I should see "newbie@example.com"

  Scenario: User must have an email
    And I fill in "Email" with ""
    And I fill in "Password" with "password"
    And I fill in "Name" with "User Name"
    And I press "Create User"
    Then I should see "User has not been created."
    And I should see "Email can't be blank"

  Scenario: Creating an admin user
    And I fill in "Email" with "newadmin@example.com"
    And I fill in "Password" with "password"
    And I fill in "Name" with "Powerful Name"
    And I check "user_admin"
    And I press "Create User"
    Then I should see "User has been created."
    And I should see "Powerful Name"
    And I should see "Admin"
