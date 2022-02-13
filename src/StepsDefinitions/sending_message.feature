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
  Scenario: Player sends a message to an offline user
    Given a player "kalvin@email.com" is logged into the system
    And a player "hongyi@email.com" is not logged into the system
    When the player "kalvin@email.com" sends a message to another player "hongyi@email.com"
    Then the player "kalvin@email.com" unsuccessfully sent the message to the other player "hongyi@email.com"
    And an error is generated with message "User is not online"

  # Error flow
  Scenario: Player sends an empty message to another user
    Given a player "kalvin@email.com" is logged into the system
    And a player "hongyi@email.com" is logged into the system
    When the player "kalvin@email.com" sends an empty message to another player "hongyi@email.com"
    Then the player "kalvin@email.com" unsuccessfully sent the message to the other player "hongyi@email.com"
    And an error is generated with message "Message can not be empty"

    # Error flow
  Scenario: Player sends an message to non-existing user
    Given a player "kalvin@email.com" is logged into the system
    And player "hongyi@email.com" does not exist in the system
    When the player "kalvin@email.com" sends an empty message to a  "hongyi@email.com"
    Then no message shall be sent
    And an error is generated with message "Player does not exist"