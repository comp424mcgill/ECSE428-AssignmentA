# Hong Yi Meng 260978023
# Kalvin Khuu 260983539

Feature: Play Against Bots

  As a player
  I would like to play against bots
  so I can practice without affecting my rank.

  Background:
    Given the following user-players exist in the system:
      | username |
      | PlayerA  |

  # Normal Flow
  Scenario: Playing against bots
    Given "PlayerA" is logged into the system
    When "PlayerA" chooses to play against bots
    Then a game shall be started with "PlayerA" and 3 bots

