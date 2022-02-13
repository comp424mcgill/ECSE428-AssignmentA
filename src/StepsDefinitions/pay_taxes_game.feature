Feature: Paying taxes money

  As a player
  I shall pay 200$ when landing on a tax space
  To abide by the rules of the monopoly game

  # Normal flow
  Scenario Outline: Player lands the Income Tax space and has enough money
    Given a player's turn
    And the player's position after the dice roll
    And the player's balance <previousBalance>
    When the player lands the Income Tax space
    Then the player's balance gets substracted by 200$ <currentBalance>
    And the player's turn ends

    Examples:
      | previousBalance  | currentBalance |
      | 400$             | 200$           |
      | 200$             | 0$             |


  # Alternative flow
  Scenario: Player lands the Luxury Tax space and has enough money
    Given a player's turn
    And the player's position after the dice roll
    And the player's balance <previousBalance>
    When the player lands the Luxury Tax space
    Then the player's balance gets substracted by 200$ <currentBalance>
    And the player's turn ends

      # Alternative flow
  Scenario: Player lands the Income Tax space and doesn't have enough money
    Given a player's turn
    And the player's position after the dice roll
    And the player's balance <notEnoughBalance>
    When the player lands the Income Tax space
    Then the player needs to sell properties to have enough money to pay
    And the player's turn ends

      # Alternative flow
  Scenario: Player lands the Luxury Tax space and doesn't have enough money
    Given a player's turn
    And the player's position after the dice roll
    And the player's balance <notEnoughBalance>
    When the player lands the Luxury Tax space
    Then the player needs to sell properties to have enough money to pay
    And the player's turn ends

