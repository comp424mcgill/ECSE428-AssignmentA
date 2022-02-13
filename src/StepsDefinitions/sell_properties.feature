Feature: Sell properties

  As a player
  I would like to sell properties
  To get money from them

  # Normal Flow
  Scenario Outline: Player sells one of their properties
    Given a player's turn <curPlayer>
    And the player's balance <balance>
    And the property value <propertyValue>
    And the player's properties <playerProperties>
    When the player sells one of their properties <property>
    Then the player's balance increments by the property value
    Then the property is removed from the player's properties

    Examples:
      | curPlayer | balance | playerProperties       | propertyValue | property  |
      | Player A  | 400$    | Boardwalk, Park Place  | 200           | Boardwalk |