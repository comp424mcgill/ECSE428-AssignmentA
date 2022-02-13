# Hong Yi Meng 260978023
# Kalvin Khuu 260983539

Feature: Retrieve forgotten password
  As a player or moderator
  I would like to retrieve my forgotten password
  So I can access my account

  # Normal Flow
  Scenario Outline: Player requests to retrieve their password
    Given a user with email <email>
    When the user request to retrieve their password using their email <email>
    Then a request is send by email

    Examples:
      | email            |
      | kalvin@email.com |
      | hongyi@email.com |

    # Error flow
  Scenario Outline: Player tries to request to retrieve their password with an inexistent email
    Given a user with email "someEmail"
    When the user request to retrieve their password using their email "someEmail"
    Then an error is generated with message "This email does not have any account linked"