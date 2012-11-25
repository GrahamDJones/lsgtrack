Feature: Ticket notifications

  Background:
    Given there are the following users:
      | email             | password |
      | alice@example.com | password |
      | bob@example.com   | password |

    Given a clear email queue

    Given there is a project called "Time Tracker"
    And "alice@example.com" can view the "Time Tracker" project
    And "bob@example.com" can view the "Time Tracker" project
    And "alice@example.com" has created a ticket for this project:
      | title        | description       |
      | Release date | TBA very shortly. |
    Given I am signed in as "bob@example.com"
    And I am on the homepage

  Scenario: Ticket owner is automatically subscribed to a ticket
    When I follow "Time Tracker"
    And I follow "Release date"
    And I fill in "Text" with "Is it out yet?"
    And I press "Create Comment"

    Then "alice@example.com" should receive an email
    When "alice@example.com" opens the email
    Then they should see "updated the Release date ticket" in the email body
    And the email should contain 2 parts
    And there should be a part with content type "text/plain"
    And there should be a part with content type "text/html"
    And they should see "[LSG Tracker] Time Tracker - Release date" in the email subject
    Then they follow "view this ticket on line here" in the email
    Then I should see "Release date" within "#ticket h2"
