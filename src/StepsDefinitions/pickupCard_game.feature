Feature: Pickup a Card
  As a player
  I would like to pick up a Card if I ever land on the chance or community chest space
  To get a surprise event

  # Normal scenario
  Scenario Outline: Player lands on a Chance or community chest space
    Given a player's turn
    And the player's position after the dice roll
    When the player's position is on a Chance or Community chest space
    Then the player will pick up a card from the respective pile
    And the player will interact with the card's event