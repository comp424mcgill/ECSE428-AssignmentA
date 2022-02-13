Feature:
  As a user
  I would like to view a game as a viewer
  To watch the game without participating

  # Normal flow
  Scenario Outline: Viewers join an existing game
    Given a game with a number ID <gameID>
    When a user join a game as a viewer
    Then the user can watch the game

    |gameID|
    |0110  |

  # Error flow
  Scenario Outline: Viewers join an inexistant game
    Given no game with a number ID "1010"
    When a user join a game as a viewer
    Then the user can not watch the game
    And an error is generated with message "This game ID does not exist"