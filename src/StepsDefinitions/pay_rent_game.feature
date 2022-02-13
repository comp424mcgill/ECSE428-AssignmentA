Feature: Pay rent

  As a player
  I would like to pay rent to another player
  To abide to the rules of Monopoly

  # Normal Flow
  Scenario Outline: Player lands on another player's property
    Given a player's turn <curPlayer>
    And another player is playing <otherPlayer>
    And the current player's position
    And the current player's balance <curPlayerBalance>
    And the other player's balance <otherPlayerBalance>
    And the other player's properties <otherPlayerProperties>
    When the current player lands on one of the properties of the other player
    Then the current player pays the other player the rent amount of the property <rent>
    Then the current player's turn ends

    Examples:
    | curPlayer | otherPlayer | curPlayerBalance | otherPlayerBalance | otherPlayerProperties | rent |
    | PlayerA   | PlayerB     | 400              | 300                | Boardwalk, Park Place | 50   |


    # Alternative Flow
  Scenario: Player lands on another player's property, but missing money
    Given a player's turn <curPlayer>
    And another player is playing <otherPlayer>
    And the current player's position
    And the current player's balance <notEnoughPlayerBalance>
    And the other player's balance <otherPlayerBalance>
    And the other player's properties <otherPlayerProperties>
    When the current player lands on one of the properties of the other player
    Then the current player sells properties until the amount needed is reached
    Then the current player pays the other player the rent amount of the property <rent>
    Then the current player's turn ends

        # Alternative Flow
  Scenario: Player lands on another player's property, but goes bankrupt
    Given a player's turn <curPlayer>
    And another player is playing <otherPlayer>
    And the current player's position
    And the current player's balance <notEnoughPlayerBalance>
    And the other player's balance <otherPlayerBalance>
    And the other player's properties <otherPlayerProperties>
    When the current player lands on one of the properties of the other player
    Then the current player sells properties
    Then the current player give all their money to the other player
    Then the current player is out of the game
    Then the next player's turn starts
