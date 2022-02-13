Feature: Chat between players
  As a player
  I would like to send messages to other user
  To have a conversation with the other user

  # Normal Flow
  Scenario Outline: Player successfully sends a message to another user
    Given a player <sender> is logged into the system
    And a player <recipient> is logged into the system
    When the player <sender> sends a message <message> to another player <recipient>
    Then the player <sender> successfully sent the message to the other player <recipient>
    And the player <recipient> successfully received the message from the player <sender>

    Examples:
      | sender           | message  | recipient         |
      | kalvin@email.com | Sup      | hongyi@email.com  |
      | hongyi@email.com | GGWP     | kalvin@email.com  |

  # Error flow
  Scenario Outline: Player sends a message to an offline user
    Given a player <sender> is logged into the system
    And a player <recipient> is not logged into the system
    When the player <sender> sends a message to another player <recipient>
    Then the player <sender> unsuccessfully sent the message to the other player <recipient>
    And an error is generated with message "User is not online"

  # Error flow
  Scenario Outline: Player sends an empty message to another user
    Given a player <sender> is logged into the system
    And a player <recipient> is logged into the system
    When the player <sender> sends an empty message to another player <recipient>
    Then the player <sender> unsuccessfully sent the message to the other player <recipient>
    And an error is generated with message "Message can not be empty"