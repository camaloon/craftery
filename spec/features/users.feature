Feature: Managing Users

  Background:
    Given the following Users exist in the system
      | Username | Name         | Email         | Password |
      | paco     | paco pruebas | paco@test.com | 1234     |

  Scenario:
    When I visit the "Signup" Page
    And  I fill the text values of the form as follows
      | Field                 | Value         |
      | * Name                | pepe trueno   |
      | * Email               | pepe@test.com |
      | * Username            | pepet         |
      | * Password            | 1234abcd      |
      | Password confirmation | 1234abcd      |
    And  I click on "Sign up!"
    Then the system informs me of the operation's success stating "User was successfully created."

  Scenario:
    When I visit the "Login" Page
    And  I fill the text values of the form as follows
      | Field    | Value |
      | Username | paco  |
      | Password | 1234  |
    And  I click on "Log in!"
    Then the page shows
      | Content |
      | Log out |

  Scenario:
    Given I am identified in the system as "paco" using password "1234"
    When  I visit the "Root" Page
    And   I click on "Log out"
    Then  the system informs me of the operation's success stating "You just logged out."
