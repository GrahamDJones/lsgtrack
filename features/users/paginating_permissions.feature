Feature: Paginating permissions
  In order to ease the load on the server
  As the system
  I want to paginate user permission grants

  Background:
    Given there is a default ticket state called "New"
    Given there is a ticket state called "Open"
    Given there are the following users:
      | email             | password | admin |
      | admin@example.com | password | true  |
      | user@example.com  | password | false |
    And I am signed in as "admin@example.com"
    And there is a default project state called "Open"
    Given there are 40 projects
    When I follow "Admin"
    And I follow "Users"
    And I follow "user@example.com"
    And I follow "Permissions"

  Scenario: Viewing the second page
    Then I should see 4 pages of pagination
    When I follow "Next" within ".pagination .next"
    Then I see page 2 of permissions for this user
