Feature: View reports
  As a moderator
  I would like to see the reports of a player
  So I can decide if I should ban him

  # Normal Flow
  Scenario Outline: Moderator checks the reports of a player
    Given a moderator is logged into the system <moderator>
    And a player exist in the system <player>
    When the moderator checks the player's account
    Then the moderator sees the reports to the players <reports>

    Examples:
    | moderator | player  | reports     |
    | modA      | playerA | Kinda Toxic |

  # Error Flow
  Scenario: Moderator tries to check the reports of an inexistent player
    Given a moderator is logged into the system <moderator>
    When the moderator checks the inexistent player's account
    Then an error is generated with message "User does not exist"
