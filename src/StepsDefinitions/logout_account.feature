Feature: Logout Account

  As a player or moderator
  I would like to logout
  So I can login with another account or prevent people from using my account

  # Normal Flow
  Scenario: Player successfully logout to their account
    Given a user is logged into the system
    When the player wants to end the session and attempts to log out
    Then the account no longer has access to the system and logs out

  # Alternative Flow
  Scenario: The account of player automatically logs out after being inactive for an hour
    Given a user is logged into the system
    When a user is inactive for an hour
    Then the account no longer has access to the system and logs out
