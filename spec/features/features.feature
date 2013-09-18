Feature: Managing Features
  Background:
    Given the following Users exist in the system
      | Username | Name      | Email              | Password |
      | testuser | test user | testuser@test.test | 1234     |
    And I am identified in the system as "testuser" using password "1234"
    And the following Projects exist in the system
      | Name | Description    |
      | test | a test project |
    And the project "test" has the following Features
      | Name   | Owner    | State  | Description                |
      | test 1 | testuser | draft  | test feature 1 description |
      | test 2 | testuser | frozen | test feature 2 description |

  Scenario:
    When I visit the "Project" Page for Project "test"
    Then the following Features should be displayed in a list
      | Name   | Owner    | State  | Description                |
      | test 1 | testuser | draft  | test feature 1 description |
      | test 2 | testuser | frozen | test feature 2 description |

# Feature Details

  Scenario:
    When I visit the "Project" Page for Project "test"
    And  I click the "Test 1" Link for Feature "test 1" in the List
    Then the "test 1" Feature's Details are displayed

# New Feature

  Scenario:
    When I visit the "Project" Page for Project "test"
    And  I click the "New Feature" link
    Then the New Feature Form is displayed

  Scenario:
    When I visit the "New Project Feature" Page for Project "test"
    And  I fill the text values of the form as follows
      | Field       | Value         |
      | * Name      | a name        |
    And  I click the "Create Feature" link
    Then the system informs me of the operation's success stating "Feature was successfully created."

# Edit Feature

  Scenario:
    When I visit the "Project" Page for Project "test"
    And  I click the "Edit Feature" Link for Feature "test 1" in the List
    Then the Edit Feature Form is displayed populated with the values for Feature "test 1"

  Scenario:
    When I visit the "Feature" Page for Feature "test 1"
    And  I click the "Edit" link
    Then the Edit Feature Form is displayed populated with the values for Feature "test 1"

  Scenario:
    When I visit the "Edit Feature" Page for Feature "test 1"
    And  I modify the text values of the form as follows
      | Field       | Value             |
      | * Name      | a new name        |
      | Description | a new description |
    And  I click the "Update Feature" link
    Then the system informs me of the operation's success stating "Feature was successfully updated."
    And  the Feature Page displays showing "a new name" and "a new description"

# Delete Feature

  Scenario:
    When I visit the "Feature" Page for Feature "test 1"
    And  I click the "Delete" link
    Then the system informs me of the operation's success stating "Feature was successfully destroyed."

  Scenario:
    When I visit the "Edit Feature" Page for Feature "test 1"
    And  I click the "Delete" link
    Then the system informs me of the operation's success stating "Feature was successfully destroyed."
