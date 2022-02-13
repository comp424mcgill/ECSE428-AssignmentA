Feature: Add Friends
  As a player
  I would like send friend request to other users
  So I can play games with my friends

  # Normal Flow
  Scenario Outline: Player successfully send a friend request to another player
    Given a player <playerA> is logged into the system
    And another player <playerB> exist in the system
    When the player <playerA> attempts to send a friend request using the other player email <playerB>
    Then the player successfully sent a request to the other player

    Examples:
      | playerA | playerB |
      | Kalvin  | Hong Yi |

  # Error Flow
  Scenario: Player unsuccessfully send a friend request to another player that does not exist
    Given a player is logged into the system
    When the player "Kalvin" attempts to send a friend request using an non-existing email "nonExisting_email"
    Then the player unsuccessfully sent a friend request to the other player
    Then an error is generated with message "User does not exist"

