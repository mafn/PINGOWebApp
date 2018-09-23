Feature: others
  Scenario: Stats as guest
    When I go to the stats page
    Then I should see "Votes:"
    And I should not see "Users:"
  Scenario: Stats as user
    Given I am logged in
    When I go to the stats page
    Then I should see "Votes:"
    And I should not see "Users:"

  Scenario: Stats as admin
    Given I am Admin
    When I go to the stats page
    Then I should see "Votes:"
    And I should see "Users:"
