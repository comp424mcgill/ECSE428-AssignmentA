# Hong Yi Meng 260978023
# Kalvin Khuu 260983539

Feature:
  As a player
  I would like to start a game
  To have fun

  # Normal Flow
  Scenario Outline: Player starts a game
    Given a party of players <players>
    And the party leader <leader>
    When the party leader starts a game
    Then all players has 1500$ as a starting balance
    Then all players starts on the GO space

    Examples:
    | players                   | leader  |
    | PlayerA, PlayerB, PlayerC | PlayerA |

  # Error Flow
  Scenario: Player starts a game by themself
    Given a party of players "PlayerA"
    And the party leader "PlayerA"
    When the party leader starts a game
    Then an error is generated with message "Not Enough players"