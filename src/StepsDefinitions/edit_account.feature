Feature: Edit Account Details
  As a player
  I would like to edit account details
  So that my account can be secure if someone has access to my old password or change details


      # Normal Flow
  Scenario Outline: Player requests to change their password

    Given a player with an email <email> and password <password>
    When the player requests to change their password to <newPassword>
    Then the player's password is now <newPassword>

    Examples:
      | email            | password  | newPassword  |
      | kalvin@email.com | password1 | newPassword1 |
      | hongyi@email.com | password2 | newPassword2 |

    # Alternate Flow
  Scenario Outline: Player request to change their email

    Given a player with an email <email> and password <password>
    When the player requests to change their email to <newEmail>
    Then the player's email is now <newEmail>

    Examples:
      | email            | password  | newEmail  |
      | kalvin@email.com | password1 | newEmail1 |
      | hongyi@email.com | password2 | newEmail2 |

    # Error Flow
  Scenario: Player requests to change the password, but the field is empty
    Given a player with an email "kalvin@email.com" and password "password1"
    When the player requests to change their password to an empty string
    Then an error is generated with message "Please enters your new password"


    # Error Flow
  Scenario: Player requests to change the email, but the field is empty
    Given a player with an email "kalvin@email.com" and password "password1"
    When the player requests to change their email to an empty string
    Then an error is generated with message "Please enters your new email"


