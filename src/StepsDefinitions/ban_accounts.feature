Feature: Ban user's account
  As a moderator
  I would like to ban accounts
  To not allow them to log into their account

  # Normal Flow
  Scenario Outline: Moderator bans a player
    Given a moderator is logged into the system <moderator>
    And a player exist in the system "<player>"
    And a player's database "<database>"
    When the moderator bans the player's account
    Then the player's account has a status of ban
    And the player can't join the account

    Examples:
      | moderator | player  | database          |
      | modA      | playerA | playerA, playerB  |

  # Error Flow
  Scenario: Moderator tries to ban an inexistent player
    Given a moderator is logged into the system "modA"
    And a player's database {playerA, playerB}
    When the moderator bans the player's account "playerC"
    Then an error is generated with message "User does not exist"
