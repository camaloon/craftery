Feature: Managing Users
  Background:
    Given there is a user in the system that has the following data
      | Username | Name      | Email             | Password |
      | testusr  | test user | testusr@test.test | 123abc   |

  Scenario:
    When I visit the "Signup" Page
    And  I fill the values of the form as follows
      | Field                 | Value                 |
      | * Name                | Test User 2           |
      | * Email               | test.user.2@test.test |
      | * Username            | testusr2              |
      | * Password            | 1234abcd              |
      | Password confirmation | 1234abcd              |
    And  I click the "Sign up!" link
    Then the system informs me of the operation's success stating "User was successfully created."

  Scenario:
    When I visit the "Login" Page
    And  I fill the values of the form as follows
      | Field    | Value   |
      | Username | testusr |
      | Password | 123abc  |
    And  I click the "Log in!" link
    Then I should be informed that I successfully logged in

  Scenario:
    Given I am identified in the system as "testusr" using password "123abc"
    When I visit the "Root" Page
    And  I click the "Log out" link
    Then the system informs me of the operation's success stating "You just logged out."
