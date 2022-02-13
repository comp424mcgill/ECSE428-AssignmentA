# Hong Yi Meng 260978023
# Kalvin Khuu 260983539

Feature: Go to jail
  As a player
  I would like to go to jail
  To abide by the rules of Monopoly

  # Normal Flow
  Scenario: Player lands on the Go to Jail space
    Given a player's turn
    And the player's position after the dice roll
    When the player lands on the Go to Jail space
    Then the player's position gets moved to the Jail space

    # Alternative Flow
  Scenario: Player picks up a Chance or Community Chest card that tells them to go to jail
    Given a player's turn
    When the player picks up a Go to Jail card
    Then the player's position gets moved to the Jail space