Feature: Buying a property
  As a player
  I would like to buy a property
  So that I could use it as an investment

  # Normal Flow
  Scenario Outline: Player buys property by landing on it
    Given a player turn <curPlayer>
    And the player's position after the dice roll
    And the player's properties <properties>
    And the property's cost <cost>
    And the player's balance <balance>
    When the player wants to buy a property <property>
    Then the player's balance decrements by the property's cost <afterBalance>
    Then the property gets added to the player's properties <afterProperties>
    Then the player's turn ends

    Examples:
      | curPlayer | balance | properties  | cost | property  | afterBalance | afterProperties       |
      | Player A  | 400     | Park Place  | 400  | Boardwalk | 0            | Boardwalk, Park Place |

  # Error Flow
  Scenario: Player tries to buy a property but doesn't have enough money
    Given a player turn <curPlayer>
    And the player's position after the dice roll
    And the player's properties <properties>
    And the property's cost <cost>
    And the player's balance <notEnoughBalance>
    When the player wants to buy a property
    Then an error is generated with message "Balance too low"
    Then the player's turn ends
