Feature: Checks account's statistics
  As a player
  I would like to check my statistics
  So I could improve my technique

  # Normal Flow
  Scenario Outline: Player checks their statistics
    Given a player with email <email> and password <password>
    When the player requests to check statistics