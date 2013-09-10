Feature: Managing Features
  Background:
    Given I am identified in the system with the following data
      | Username | Name      |
      | testuser | test user |
    Given the following Projects exist in the system
      | Name | Description    |
      | test | a test project |
    And the project "test" has the following Features
      | Name   | Owner    | State  | Description                |
      | test 1 | testuser | draft  | test feature 1 description |
      | test 2 | testuser | frozen | test feature 2 description |

#  Scenario:
#    When I visit the "Project" Page for Project "test"
#    Then the following Features should be displayed in a list
#      | Name   | Owner    | State  | Description                |
#      | test 1 | testuser | draft  | test feature 1 description |
#      | test 2 | testuser | frozen | test feature 2 description |

# Feature Details

#  Scenario:
#    When I visit the Project's Detail Page for Project "test"
#    And  I click the "Test 1" Link for Feature "test 1" in the Feature List
#    Then the "test 1" Feature's Details are displayed
#
## New Project
#
#  Scenario:
#    When I visit the Project's Detail Page for Project "test"
#    And  I click the "New Feature" link
#    Then the New Feature Form is displayed
#
#  Scenario:
#    When I visit the New Feature Form
#    And  I fill the values of the form as follows
#      | Field       | Value         |
#      | * Name      | a name        |
#    And  I click the "Create Feature" link
#    Then the system informs me of the operation's success stating "Feature was successfully created."
#
## Edit Project
#
#  Scenario:
#    When I visit the Project's Detail Page for Project "test"
#    And  I click the "Edit Feature" Link for Feature "test 1" in the Feature List
#    Then the Edit Feature Form is displayed populated with the values for Feature "test 1"
#
#  Scenario:
#    When I visit the Features's Detail Page for Feature "test 1"
#    And  I click the "Edit" link
#    Then the Edit Feature Form is displayed populated with the values for Feature "test 1"
#
#  Scenario:
#    When I visit the Edit Feature Form for Feature "test 1"
#    And  I modify the values of the form as follows
#      | Field       | Value             |
#      | * Name      | a new name        |
#      | Description | a new description |
#    And  I click the "Update Project" link
#    Then the system informs me of the operation's success stating "Feature was successfully updated."
#    And  the Feature Details Page displays showing "a new name" and "a new description"
#
## Delete Project
#
#  Scenario:
#    When I visit the Features's Detail Page for Feature "test 1"
#    And  I click the "Delete" link
#    Then the system informs me of the operation's success stating "Feature was successfully destroyed."
