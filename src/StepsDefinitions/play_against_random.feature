Feature: Play Against Random

  As a player
  I would like to play against random players online
  when I don't have friends to play with.

  Background:
    Given the following user-players exist in the system:
      | username |
      | PlayerA  |
      | PlayerB  |
      | PlayerC  |
      | PlayerD  |

  # Normal Flow
  Scenario: Player gets grouped with 3 other players
    Given "PlayerA" is logged into the system
    Given "PlayerB" is logged into the system
    Given "PlayerC" is logged into the system
    Given "PlayerD" is logged into the system
    Given "PlayerB" has chosen to play against random players
    And "PlayerB" has been placed into the matchmaking pool
    And "PlayerC" has chosen to play against random players
    And "PlayerC" has been placed into the matchmaking pool
    And "PlayerD" has chosen to play against random players
    And "PlayerD" has been placed into the matchmaking pool
    When "PlayerA" chooses to play against randoms
    Then "PlayerA" shall be placed into the matchmaking pool
    Then a game shall be started with "PlayerA", "PlayerB", "PlayerC" and "PlayerD"

    # Alternate Flow
  Scenario: Not enough players in the matchmaking pool
    Given "PlayerA" is logged into the system
    Given "PlayerB" is logged into the system
    Given "PlayerC" is logged into the system
    Given "PlayerB" has chosen to play against random players
    And "PlayerB" has been placed into the matchmaking pool
    And "PlayerC" has chosen to play against random players
    And "PlayerC" has been placed into the matchmaking pool
    When "PlayerA" chooses to play against randoms
    Then "PlayerA" shall be placed into the matchmaking pool
    Then a game shall not be started until more players join
