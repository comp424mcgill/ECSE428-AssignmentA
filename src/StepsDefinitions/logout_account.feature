Feature: Logout Account

  As a player
  I would like to logout
  So I can login with another account or prevent people from using my account

  # Normal Flow
  Scenario Outline: Player successfully logout to their account
    Given a player is logged into the system
    When the player wants to end the session and attempts to log out
    Then the account no longer has access to the system and logs out

  # Alternative Flow
  Scenario Outline: The account of player automatically logs out after being inactive for an hour
    Given a player is logged into the system
    