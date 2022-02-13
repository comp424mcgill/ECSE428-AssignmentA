# Hong Yi Meng 260978023
# Kalvin Khuu 260983539

Feature: View Player Profile

  As a player
  I would like to view other people's profiles
  To compare myself to them

  Background:
    Given the following user-players exist in the system:
      | username |
      | PlayerA  |
      | PlayerB  |

  # Normal Flow
  Scenario: View existing player profile
    Given "PlayerA" is logged into the system
    When "PlayerA" attempts to view "PlayerB"'s profile
    Then "PlayerB"'s shall be displayed

    # Alternate Flow
  Scenario: View personal profile
    Given "PlayerA" is logged into the system
    When "PlayerA" attempts to view his own profile
    Then "PlayerA"'s shall be displayed

    # Error Flow
  Scenario: Player attempts to view non-existing player profile
    Given "PlayerA" is logged into the system
    When "PlayerA" attempts to view "PlayerC"'s profile
    Then an error shall be displayed indicating that the player does not exist
