Feature: Report player
  As a player
  I would like to report a player
  To keep an non-toxic environment

  # Normal Flow
  Scenario Outline: Player successfully report a player
    Given a player <playerA> is logged into the system
    And another player <playerB> exist in the system
    When the reporter reports the reportee
    Then the reporter successfully report a player

  # Error Flow
  Scenario Outline: Player tries to report a player that does not exist
    Given a player <playerA> is logged into the system
    When the reporter reports the reportee
    Then an error is generated with message "User does not exist"
    Then the reporter unsuccessfully report a player