Feature: Receive friend requests
  As a player
  I would like to receive friend requests
  So I can filter out which users I want to be friends with

  # Normal Flow
  Scenario Outline: Player successfully receive a friend request from another player and accepts it
    Given a player <playerA> is logged into the system
    And another player <playerB> exist in the system
    When the player <playerA> receives a friend request from another player <playerB>
    Then the player <playerA> accepts the friend request
    Then the player <playerA> has the other player <playerB> in their friends list
    Then the player <playerB> has the other player <playerA> in their friends list

    Examples:
    | playerA | playerB |
    | Kalvin  | Hong Yi |

  # Alternative Flow
  Scenario Outline: Player successfully receive a friend request from another player and declines it
    Given a player <playerA> is logged into the system
    And another player <playerB> exist in the system
    When the player <playerA> receives a friend request from another player <playerB>
    Then the player <playerA> declines the friend request
    Then the player <playerA> does not have the other player <playerB> in their friends list
    Then the player <playerB> does not have the other player <playerA> in their friends list

    Examples:
      | playerA | playerB |
      | Kalvin  | Hong Yi |

  # Error Flow
  Scenario: Player unsuccessfully receive a friend request to another player that does not exist
    Given a player is logged into the system
    When the player "Kalvin" receives a friend request from a deleted player "Kevin"
    Then an error is generated with message "User does not exist"
    Then the player "Kalvin" unsuccessfully received the friend request

