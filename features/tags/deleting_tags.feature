Feature: Deleting tags
  In order to remove old tags
  As a user
  I want to click a button and make them go away

  Background:
    Given there are the following users:
      | email            | password |
      | user@example.com | password |
    And I am signed in as them
    And there is a default project state called "Open"
    And there is a project called "Time Tracker"
    And "user@example.com" can view the "Time Tracker" project
    And "user@example.com" can tag the "Time Tracker" project
    And "user@example.com" has created a ticket for this project:
      | title | description      | tags              |
      | A tag | Tagging a ticket | this-tag-must-die |
    Given I am on the homepage
    When I follow "Time Tracker" within "#projects"
    And I follow "A tag"

  @javascript
  Scenario: Deleting a tag
    When I follow "delete-this-tag-must-die"
    Then I should not see "this-tag-must-die"