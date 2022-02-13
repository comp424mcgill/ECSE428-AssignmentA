Feature: Create Party

  As a player
  I would like to create a party
  So I can invite my friends to play with me.

  Background:
    Given the following user-players exist in the system:
      | username |
      | PlayerA  |

  # Normal Flow
  Scenario: Player creates a party
    Given "PlayerA" is logged into the system
    When "PlayerA" creates a new party
    Then a new party shall be created
    Then an invite link shall be provided to "PlayerA"

    # Error Flow
  Scenario: Player creates a party
    Given "PlayerA" is logged into the system
    Given "PlayerA" already have an ongoing party "382900"
    When "PlayerA" creates a new party
    Then no new party shall be created
    And an error is generated with message "You already have an party"


