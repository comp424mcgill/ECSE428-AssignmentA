Feature: View Online Friends

  As a player
  I would like to remove friends
  So I can make room for new ones.

  Background:
    Given the following user-players exist in the system:
      | username |
      | PlayerA  |
      | PlayerB  |

  # Normal Flow
  Scenario: Player removes friend from friend list
    Given "PlayerA" is logged into the system
    Given "PlayerA" and "PlayerB" are friends
    When "PlayerA" decides to remove "PlayerB" as friend
    Then "PlayerB" shall no longer appear on "PlayerA"'s friend list

    # Error Flow
  Scenario: Player tries to remove stranger from friend list
    Given "PlayerA" is logged into the system
    Given "PlayerA" and "PlayerB" are not friends
    When "PlayerA" decides to remove "PlayerB" as friend
    Then an error message shall be displayed forbidding the operation
