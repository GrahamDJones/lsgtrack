Feature: Paginating users
  In order to ease the load on the server
  As the system
  I want to paginate user lists

  Background:
    Given there are 90 users
    Given there are the following users:
      | email             | password | admin |
      | admin@example.com | password | true  |
    And I am signed in as "admin@example.com"
    When I am on the homepage
    When I follow "Admin"
    And I follow "Users"

  Scenario: Viewing the second page
    Then I should see 4 pages of pagination
    When I follow "Next" within ".pagination .next"
    Then I see page 2 of users
