# Hong Yi Meng 260978023
# Kalvin Khuu 260983539

Feature: Collecting money from the GO space

  As a player
  I would like to collect 200$ every time I pass the space GO
  To get free money

  # Normal flow
  Scenario: Player passes the GO space without landing on it
    Given a player's turn
    And the player's position after the dice roll
    When the player passes the GO space
    Then the player is awarded 200$
    And the player interacts with the space they land on

  # Alternative flow
  Scenario: Player lands the GO space
    Given a player's turn
    And the player's position after the dice roll
    When the player passes the GO space
    Then the player is awarded 200$
    And the player's turn ends
