Feature: View Online Friends

  As a player
  I would like to see which of my friends are currently online
  So I can play with them or spectate their game

  Background:
    Given the following user-players exist in the system:
    | username |
    | PlayerA  |
    | PlayerB  |

  # Normal Flow
  Scenario: Player has friends online
    Given "PlayerA" is logged into the system
    Given "PlayerB" is logged into the system
    Given "PlayerA" and "PlayerB" are friends
    When "PlayerA" chooses to view online friend list
    Then "PlayerB" shall be displayed on "PlayerA"'s online friend list

  # Alternative Flow
  Scenario: Player does not have friends online
    Given "PlayerA" is logged into the system
    Given "PlayerB" is not logged into the system
    Given "PlayerA" and "PlayerB" are friends
    When "PlayerA" chooses to view online friend list
    Then "PlayerA"'s online friend list shall remain empty