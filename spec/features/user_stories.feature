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
    And the project "test" has the following Personas defined
      | Name  |
      | User  |
      | Admin |
    And the feature "test" has the following User Stories
      | Feature      | Author | Persona | Desire                        | Benefit               |
      | colors       | juan   | User    | see important buttons in blue | spot them at a glance |
      | delete users | juan   | Admin   | delete abusing users          | blow their minds ;p   |

# TODO: Test User Story list (see also features and project)

# User Story Details

  Scenario:
    When I visit the "Project Feature" Page for Feature "mind blowness"
    And  I click the "colors" Link for User Story "colors" in the List
    Then the "colors" User Story Details are displayed

# New User Story

  Scenario:
    When I visit the "Project Feature" Page for Feature "mind blowness"
    And  I click the "New User Story" link
    Then the New User Story Form is displayed

  Scenario:
    When I visit the "New Project Feature User Story" Page for Feature "mind blowness"
    And  I fill the values of the form as follows
      | Field     | Value             |
      | * Persona | User              |
      | * Desire  | create projects   |
      | * Benefit | track them easily |
    And  I click the "Create User Story" link
    Then the system informs me of the operation's success stating "User Story was successfully created."

# Edit Project

  Scenario:
    When I visit the "Project Feature" Page for Feature "mind blowness" of Project "craftery"
    And  I click the "Edit User Story" Link for User Story "colors" in the List
    Then the Edit User Story Form is displayed populated with the values for User Story "colors"

  Scenario:
    When I visit the "Project Feature User Story" Page for User Story "colors"
    And  I click the "Edit" link
    Then the Edit User Story Form is displayed populated with the values for User Story "colors"

  Scenario:
    When I visit the "Edit Project Feature User Story" Page for User Story "colors"
    And  I modify the values of the form as follows
      | Field     | Value                            |
      | * Persona | Admin                            |
      | * Desire  | delete projects                  |
      | * Benefit | blow more abusing users minds ;p |
    And  I click the "Update User Story" link
    Then the system informs me of the operation's success stating "User Story was successfully updated."
    And  the Project Feature User Story Page displays showing "admin" and "delete projects" and "blow more abusing users minds ;p"
    # TODO: should this be tested here? same problem for features and project

# Delete User Story

  Scenario:
    When I visit the "Project Feature" Page for Feature "mind blowness" of Project "craftery"
    And  I click the "Delete User Story" Link for User Story "colors" in the List
    Then the system informs me of the operation's success stating "User Story was successfully destroyed."

  Scenario:
    When I visit the "Project Feature User Story" Page for User Story "colors"
    And  I click the "Delete" link
    Then the system informs me of the operation's success stating "User Story was successfully destroyed."

  Scenario:
    When I visit the "Edit Project Feature User Story" Page for User Story "colors"
    And  I click the "Delete" link
    Then the system informs me of the operation's success stating "User Story was successfully destroyed."

