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

    Examples:
    | playerA | playerB |
    | Kalvin  | Hong Yi |

  # Error Flow
  Scenario: Player tries to report a player that does not exist
    Given a player "Kalvin" is logged into the system
    When the reporter reports the reportee "Kevin"
    Then an error is generated with message "User does not exist"
    Then the reporter unsuccessfully report a player