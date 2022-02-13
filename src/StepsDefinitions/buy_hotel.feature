# Hong Yi Meng 260978023
# Kalvin Khuu 260983539

Feature: Buy hotel

  As a player
  I would like to buy a hotel for my properties
  To make the rent more expensive

  # Normal Flow
  Scenario Outline: Player buys a hotel after having all the requirements
    Given a player's turn <Player>
    And the player did not roll his dice
    And the player's balance <previousBalance>
    And the player's property <property> and their number of houses <houses> and hotels <hotel>
    When the player wants to buy a hotel for one of his properties
    Then the player's property gets a hotel <currentHotel> and gets all their houses removed <currentHouse>
    Then the player's balance gets substracted by the cost of the hotel <costHotel>
    Then the property's rent goes according to the description of the property <currentRent>
    Then the player rolls the dice

    Examples:
      | Player   | previousBalance  | property  | houses | hotel | currentHouse | currentHotel | costHotel | currentRent |
      | PlayerA  | 400              | Boardwalk | 4      | 0     | 0            | 1            | 200       | 2000        |

      # Error Flow
  Scenario: Player tries to buy a hotel but does not have enough money
    Given a player's turn "PlayerA"
    And the player did not roll his dice
    And the player's balance "0"
    And the player's properties "Boardwalk" and their number of houses "4" and hotels "0"
    When the player wants to buy a hotel for one of his properties
    Then an error is generated with message "Balance too low"
    Then the player rolls the dice

      # Error Flow
  Scenario: Player tries to buy a hotel but does not have enough houses
    Given a player's turn "PlayerA"
    And the player did not roll his dice
    And the player's balance "400"
    And the player's properties "Boardwalk" and their number of houses "0" and hotels "0"
    When the player wants to buy a hotel for one of his properties
    Then an error is generated with message "Missing houses"
    Then the player rolls the dice

  # Error Flow
  Scenario: Player tries to buy a hotel but already has a hotel
    Given a player's turn "PlayerA"
    And the player did not roll his dice
    And the player's balance "400"
    And the player's properties "Boardwalk" and their number of houses "0" and hotels "1"
    When the player wants to buy a hotel for one of his properties
    Then an error is generated with message "The property already has a hotel"
    Then the player rolls the dice

