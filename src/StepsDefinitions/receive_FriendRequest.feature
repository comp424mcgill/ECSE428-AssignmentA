Feature: Receive friend requests
  As a player
  I would like to receive friend requests
  So I can filter out which users I want to be friends with

  # Normal Flow
  Scenario Outline: Player successfully receive a friend request from another player
    Given a player <playerA_email> is logged into the system
    And another player <playerB_email> exist in the system
    When the player <playerA_email> receives a friend request from another player <playerB_email>
    Then the player <playerA_email> accepts the friend request
    Then the player <playerA_email> has the other player <playerB_email> in their friends list

  # Alternative Flow
  Scenario Outline: Player successfully receive a friend request from another player
    Given a player <playerA_email> is logged into the system
    And another player <playerB_email> exist in the system
    When the player <playerA_email> receives a friend request from another player <playerB_email>
    Then the player <playerA_email> declines the friend request
    Then the player <playerA_email> does not have the other player <playerB_email> in their friends list

  # Error Flow
  Scenario Outline: Player unsuccessfully send a friend request to another player that does not exist
    Given a player is logged into the system
    When the player <playerA_email> receives a friend request from a non-existing player <nonExisting_email>
    Then an error is generated with message "User does not exist"
    Then the player <playerA_email> unsuccessfully received the friend request

