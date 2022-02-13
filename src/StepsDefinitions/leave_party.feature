Feature: Leave Party

  As a player
  I would like to leave a party
  So I can join other parties.

  Background:
    Given the following user-players exist in the system:
      | username |
      | PlayerA  |
      | PlayerB  |
    Given the following parties exist in the system:
      | partyID | host    |
      | 3920491 | playerA |

  # Normal Flow
  Scenario: Guest leaves the party during a game
    Given "PlayerB" is logged into the system
    Given "PlayerB" is the party "3920491"
    Given a game is in progress in party "3920491"
    When "PlayerB" leaves the party "3920491"
    Then "PlayerB" shall no longer be in the party "3920491"
    And a bot shall take control of "PlayerB"'s assets

    # Alternate Flow
  Scenario: Host leaves the party during a game while playing against real players
    Given "PlayerA" is logged into the system
    Given "PlayerA" is the party "3920491"
    Given "PlayerB" is the party "3920491"
    Given a game is in progress in party "3920491"
    When "PlayerA" decides to leave party "3920491"
    Then "PlayerA" shall no longer be in the party "3920491"
    And a bot shall take control of "PlayerA"'s assets
    Then "PlayerB" shall be made the host

    # Alternate Flow
  Scenario: Host leaves the party with only bots during a game
    Given "PlayerA" is logged into the system
    Given "PlayerA" is the party "3920491"
    Given a game is in progress in party "3920491"
    When "PlayerA" decides to leave party "3920491"
    Then "PlayerA" shall no longer be in the party "3920491"
    And the party "3920491" shall no long exist in the system

    # Alternate Flow
  Scenario: Host leaves the party while no game is in progress
    Given "PlayerA" is logged into the system
    Given "PlayerA" is the party "3920491"
    Given "PlayerB" is the party "3920491"
    Given no game is in progress in party "3920491"
    When "PlayerA" decides to leave party "3920491"
    Then "PlayerA" shall no longer be in the party "3920491"
    Then "PlayerB" shall be made the host

    # Alternate Flow
  Scenario: Host leaves the party leaving no other players
    Given "PlayerA" is logged into the system
    Given "PlayerA" is the party "3920491"
    Given no game is in progress in party "3920491"
    When "PlayerA" decides to leave party "3920491"
    Then "PlayerA" shall no longer be in the party "3920491"
    And the party "3920491" shall no long exist in the system

    # Alternate Flow
  Scenario: Guest leaves the party leaving no other players
    Given "PlayerA" is logged into the system
    Given "PlayerB" is the party "3920491"
    Given no game is in progress in party "3920491"
    When "PlayerB" decides to leave party "3920491"
    Then "PlayerB" shall no longer be in the party "3920491"
    And the party "3920491" shall still exist in the system