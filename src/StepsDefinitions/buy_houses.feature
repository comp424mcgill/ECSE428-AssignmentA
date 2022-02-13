Feature: Buy house

  As a player
  I would like to buy a house for my properties
  To make the rent more expensive and to buy a hotel

  # Normal Flow
  Scenario Outline: Player buys a house after having all the requirements
    Given a player's turn <Player>
    And the player did not roll his dice
    And the player's balance <previousBalance>
    And the player's properties <properties> and their number of houses <houses> and hotels <hotel>
    When the player wants to buy a house for one of his properties <property>
    Then the player's property gets an extra house <currentHouse>
    Then the player's balance gets substracted by the cost of the hotel <costHouse>
    Then the property's rent goes according to the description of the property <currentRent>
    Then the player rolls the dice

    Examples:
      | Player   | previousBalance  | properties            | property  | houses | hotel | currentHouse | costHouse | currentRent |
      | PlayerA  | 400              | Boardwalk, Park Place | Boardwalk | 2      | 0     | 3            | 200       | 200         |

      # Error Flow
  Scenario: Player tries to buy a house but does not have enough money
    Given a player's turn "PlayerA"
    And the player did not roll his dice
    And the player's balance "0"
    And the player's properties "Boardwalk, Park Place" and their number of houses "2" and hotels "0"
    And the house costs "200"
    When the player wants to buy a house for one of his properties "Boardwalk"
    Then an error is generated with message "Balance too low"
    Then the player rolls the dice

      # Error Flow
  Scenario: Player tries to buy a house but does not have all the properties
    Given a player's turn "PlayerA"
    And the player did not roll his dice
    And the player's balance "400"
    And the player's properties "Park Place" and their number of houses "2" and hotels "0"
    When the player wants to buy a house for one of his properties "Park Place"
    Then an error is generated with message "Need to buy all the properties of the same color"
    Then the player rolls the dice

  # Error Flow
  Scenario: Player buys a house but already has a hotel
    Given a player's turn "PlayerA"
    And the player did not roll his dice
    And the player's balance "400"
    And the player's properties "Boardwalk, Park Place" and their number of houses "0" and hotels "1"
    When the player wants to buy a house for one of his properties "Park Place"
    Then an error is generated with message "The property already has a hotel"
    Then the player rolls the dice

