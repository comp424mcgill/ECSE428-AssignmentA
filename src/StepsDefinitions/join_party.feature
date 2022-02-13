Feature: Join Party

  As a player
  I would like to join parties
  So I can play with my friends.

  Background:
    Given the following user-players exist in the system:
      | username |
      | PlayerA  |
      | PlayerB  |
      | PlayerC  |
    Given the following parties exist in the system:
      | partyID | host    |
      | 3920491 | playerA |

  # Normal Flow
  Scenario: Player joins party using partyID
    Given "PlayerB" is logged into the system
    And party "3920491" is not at full capacity
    When "PlayerB" chooses to join the party "3920491"
    Then "PlayerB" shall be added to the party "3920491"

    # Alternate Flow
  Scenario: Player joins party through friend list
    Given "PlayerC" is logged into the system
    And "PlayerC" and "PlayerA" are friends
    And party "3920491" is not at full capacity
    When "PlayerC" joins "PlayerA"'s party from the friend list
    Then "PlayerC" shall be added to the party "3920491"

    # Error Flow
  Scenario: Player inputs the wrong partyID
    Given "PlayerB" is logged into the system
    And party "3920491" is not at full capacity
    When "PlayerB" chooses to join the party "3920492"
    Then and error message shall be displayed indicating that there is no party with that partyID

   # Error Flow
  Scenario: Player tries to join full party
    Given "PlayerB" is logged into the system
    And party "3920491" is at full capacity
    When "PlayerB" chooses to join the party "3920491"
    Then and error message shall be displayed indicating that the party is full
