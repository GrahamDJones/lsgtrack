Feature: Signing in
  In order to use the site
  As a user
  I want to be able to sign in

# Using the @javascript to change to:   DatabaseCleaner.strategy = :truncation ...
  @javascript
  Scenario: Signing in via confirmation
    Given there are the following users:
      | email            | password | unconfirmed |
      | user@example.com | password | true        |
    And Jobs are being dispatched
    And "user@example.com" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    Then I should see "Your account was successfully confirmed"
    And I should see "Signed in as user@example.com"

  Scenario: Signing in via form
    Given there are the following users:
      | email            | password |
      | user@example.com | password |
    And I am signed in as them
