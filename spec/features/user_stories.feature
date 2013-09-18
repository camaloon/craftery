Feature: Managing User Stories
  Background:
    Given the following Users exist in the system
      | Username | Name          | Password |
      | juan     | juan pruebas  | 1234     |
      | pedro    | pedro pruebas | 2345     |
    And I am identified in the system as "juan" using password "1234"
    And the following Projects exist in the system
      | Name     | Description            |
      | craftery | a really cool project! |
    And the project "craftery" has the following Features
      | Name          | Owner | State  | Description                           |
      | mind blowness | juan  | draft  | the interface has to blow users mind! |
    And the project "craftery" has the following Personas defined
      | Name  |
      | User  |
      | Admin |
    And the feature "mind blowness" has the following User Stories
      | Author | Persona | Desire                        | Benefit               | (auto-generated code) |
      | juan   | User    | see important buttons in blue | spot them at a glance | US1                   |
      | juan   | Admin   | delete abusing users          | blow their minds ;p   | US2                   |

# TODO: Test User Story list (see also features and project)

# User Story Details

  Scenario:
    When I visit the "Feature" Page for Feature "mind blowness"
    And  I click the "US1" Link for User Story "US1" in the List
    Then the "US1" User Story Details are displayed

# New User Story

  Scenario:
    When I visit the "Feature" Page for Feature "mind blowness"
    And  I click the "New User Story" link
    Then the New User Story Form is displayed

  Scenario:
    When I visit the "New Feature User Story" Page for Feature "mind blowness"
    And  I fill the text values of the form as follows
      | Field        | Value             |
      | * I want to  | create projects   |
      | * So I       | track them easily |
    And  I select the following values from the combo boxes of the form
      | Field        | Value             |
      | * As a       | User              |
    And  I click the "Create User story" link
    Then the system informs me of the operation's success stating "User story was successfully created."

# Edit User Story

  Scenario:
    When I visit the "Feature" Page for Feature "mind blowness"
    And  I click the "Edit User Story" Link for User Story "US1" in the List
    Then the Edit User Story Form is displayed populated with the values for User Story "US1"

  Scenario:
    When I visit the "User Story" Page for User Story "US1"
    And  I click the "Edit" link
    Then the Edit User Story Form is displayed populated with the values for User Story "US1"

  Scenario:
    When I visit the "Edit User Story" Page for User Story "US1"
    And  I modify the text values of the form as follows
      | Field       | Value                            |
      | * I want to | delete projects                  |
      | * So I      | blow more abusing users minds ;p |
    And  I select the following values from the combo boxes of the form
      | Field       | Value                            |
      | * As a      | Admin                            |
    And  I click the "Update User story" link
    Then the system informs me of the operation's success stating "User story was successfully updated."
    And  the page shows
      | Content                          |
      | Admin                            |
      | delete projects                  |
      | blow more abusing users minds ;p |
    # TODO: should this be tested here? same problem for features and project

# Delete User Story

  Scenario:
    When I visit the "Feature" Page for Feature "mind blowness"
    And  I click the "Delete User Story" Link for User Story "US1" in the List
    Then the system informs me of the operation's success stating "User story was successfully destroyed."

  Scenario:
    When I visit the "User Story" Page for User Story "US1"
    And  I click the "Delete" link
    Then the system informs me of the operation's success stating "User story was successfully destroyed."

  Scenario:
    When I visit the "Edit User Story" Page for User Story "US1"
    And  I click the "Delete" link
    Then the system informs me of the operation's success stating "User story was successfully destroyed."

