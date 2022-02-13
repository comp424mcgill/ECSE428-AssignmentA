Feature: Roll dice

  As a player
  I would like to roll a six face die
  So I can move my avatar in that amount of spaces

  # Normal flow
  Scenario Outline: Player rolls a non-double number when outside of jail
    Given a player's turn with a position outside of the jail space
    When the player rolls two numbers <firstDie> <secondDie> that are not the same with two dice
    Then the player moves the sum of those numbers spaces
    And the player interacts with the space

    Examples:
    | firstDie | secondDie |
    | 1        | 2         |
    | 4        | 2         |

  # Alternative flow
  Scenario Outline: Player rolls two same numbers when outside of jail
    Given a player's turn with a position outside of the jail space
    When the player rolls two numbers <firstDie> <secondDie> that are the same with two dice
    Then the player moves the sum of those numbers spaces
    And the player interacts with the space
    And the player gets to roll the dice once more

    Examples:
      | firstDie | secondDie |
      | 2        | 2         |
      | 5        | 5         |

  # Alternative flow
  Scenario Outline: Player rolls two same numbers when inside of jail
    Given a player's turn with a position inside of the jail space
    When the player rolls two numbers <firstDie> <secondDie> that are the same with two dice
    Then the player gets out of jail and moves the sum of those numbers spaces
    And the player interacts with the space
    And the player gets to roll the dice once more

    Examples:
      | firstDie | secondDie |
      | 2        | 2         |
      | 5        | 5         |

  # Alternative flow
  Scenario Outline: Player rolls a non-double number when inside of jail
    Given a player's turn with a position inside of the jail space
    When the player rolls two numbers that are not the same with two dice
    Then the player does not move
    And the player's turn ends

    Examples:
      | firstDie | secondDie |
      | 1        | 2         |
      | 5        | 6         |
