Feature: Login Account

  As a player
  I would like to login
  So

  Scenario Outline: Player successfully login to their account

    # Normal Flow
    Given a player with email <email> and password <password>
    When the player enters his details correctly
    Then the player successfully login into system

    Examples:
      | email            | password  |
      | kalvin@email.com | password1 |
      | hongyi@email.com | password2 |

    # Error Flow
  Scenario Outline: Player unsuccessfully login with the wrong email but right password

    Given a player with the email <email> and password <password>
    When the player enters the wrong email but wrong password <wrongPass>
    Then an error is generated with message "Wrong Email/Password"
    Examples:
      | email            | password  | wrongPass  |
      | kalvin@email.com | password1 | wrongPass1 |
      | hongyi@email.com | password2 | wrongPass2 |

    # Error Flow
  Scenario Outline: Player unsuccessfully login with the wrong password but with the right email
    Given a player with an email <email> and password <password>
    When the player enters the correct password but wrong email <wrongEmail>
    Then an error is generated with message "Wrong Email/Password"
    Examples:
      | email            | password  | wrongEmail     |
      | kalvin@email.com | password1 | khuu@email.com |
      | hongyi@email.com | password2 | meng@email.com |
