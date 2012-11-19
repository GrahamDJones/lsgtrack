Feature: Viewing tickets
  In order to view the tickets for a project
  As a user
  I want to be able to see them on the project's page

  Background:
    Given there is a project called "Time Tracker"
    And that project has a ticket:
      | title         | description                    |
      | Make it shiny | Gradients Starbursts! Oh My    |
    And there is a project called "Internet Explorer"
    And that project has a ticket:
      | title         | description                    |
      | Standards 101 | This is not a joke             |
    And I am on the homepage

  Scenario: Viewing tickets for a given project
    When I follow "Time Tracker"
    Then I should see "Make it shiny"
    And I should not see "Standards 101"
    When I follow "Make it shiny"
    Then I should see "Make it shiny" within "#ticket h2"
    And I should see "Gradients Starbursts! Oh My"

    When I follow "LSG Tracker"
    And I follow "Internet Explorer"
    Then I should see "Standards 101"
    And I should not see "Make it shiny"
    When I follow "Standards 101"
    Then I should see "Standards 101" within "#ticket h2"
    And I should see "This is not a joke"