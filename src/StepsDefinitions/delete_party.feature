Feature: Delete Party

  As a player
  I would like to delete parties that I created.

  Background:
    Given the following user-players exist in the system:
      | username |
      | PlayerA  |
      | PlayerB  |
      | PlayerC  |
      | PlayerD  |
    Given the following parties exist in the system:
      | partyID | host    |
      | 3920491 | playerA |

  # Normal Flow
  Scenario: Player deletes party after the game has ended
    Given "PlayerA" is logged into the system
    Given "PlayerA" is in the party "3920491"
    Given "PlayerB" is in the party "3920491"
    Given "PlayerC" is in the party "3920491"
    Given "PlayerD" is in the party "3920491"
    Given the game in party "3920491" has ended
    And and winner has been declared
    When "PlayerA" decides to delete the party "3920491"
    Then "PlayerB" shall be kicked out of the party "3920491"
    And "PlayerC" shall be kicked out of the party "3920491"
    And "PlayerD" shall be kicked out of the party "3920491"
    And "PlayerA" shall be kicked out of the party "3920491"
    And party "3920491" shall no longer exist

    # Alternate Flow
  Scenario: Player deletes the party without starting a game
    Given "PlayerA" is logged into the system
    Given "PlayerA" is in the party "3920491"
    And "PlayerB" is in the party "3920491"
    And no game is in progress in the party "3920491"
    When "PlayerA" decides to delete the party "3920491"
    And "PlayerB" shall be kicked out of the party "3920491"
    And "PlayerA" shall be kicked out of the party "3920491"
    And party "3920491" shall no longer exist

    # Error Flow
  Scenario: Player deletes the party in the middle of a game
    Given "PlayerA" is logged into the system
    Given "PlayerA" is in the party "3920491"
    Given "PlayerB" is in the party "3920491"
    Given "PlayerC" is in the party "3920491"
    Given "PlayerD" is in the party "3920491"
    Given a game is in progress in the party "3920491"
    When "PlayerA" decides to delete the party "3920491"
    Then an error is generated with message "Game in progress, cannot delete party"
    And party "3920491" shall still exist

    # Error Flow
  Scenario: Guest tries to delete the party
    Given "PlayerA" is logged into the system
    Given "PlayerA" is in the party "3920491"
    Given "PlayerB" is in the party "3920491"
    Given "PlayerC" is in the party "3920491"
    Given "PlayerD" is in the party "3920491"
    Given the game in party "3920491" has ended
    And and winner has been declared
    When "PlayerB" decides to delete the party "3920491"
    Then an error is generated with message "Only the host is allowed to delete the party"
    And party "3920491" shall still exist