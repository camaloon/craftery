Feature: Managing Projects
  Background:
    Given the following Projects exist in the system
      | Name   | Description                |
      | test 1 | test project 1 description |
      | test 2 | test project 2 description |

# Home page

  Scenario:
    When I visit the "Root" Page
    Then the following Projects should be displayed in a list
      | Name   | Description                |
      | test 1 | test project 1 description |
      | test 2 | test project 2 description |

  # Project Details

  Scenario:
    When I visit the "Root" Page
    And  I click the "Test 1" Link for Project "test 1" in the Project List
    Then the "test 1" Project's Details are displayed

  # New Project

  Scenario:
    When I visit the "Root" Page
    And  I click the "New Project" link
    Then the New Project Form is displayed

  Scenario:
    When I visit the "New Project" Page
    And  I fill the values of the form as follows
      | Field       | Value         |
      | * Name      | a name        |
    And  I click the "Create Project" link
    Then the system informs me of the operation's success stating "Project was successfully created."

  # Edit Project

  Scenario:
    When I visit the "Root" Page
    And  I click the "Edit Project" Link for Project "test 1" in the Project List
    Then the Edit Project Form is displayed populated with the values for Project "test 1"

  Scenario:
    When I visit the "Project" Page for Project "test 1"
    And  I click the "Edit" link
    Then the Edit Project Form is displayed populated with the values for Project "test 1"

  Scenario:
    When I visit the "Edit Project" Page for Project "test 1"
    And  I modify the values of the form as follows
      | Field       | Value             |
      | * Name      | a new name        |
      | Description | a new description |
    And  I click the "Update Project" link
    Then the system informs me of the operation's success stating "Project was successfully updated."
    And  the Project Page displays showing "a new name" and "a new description"

  # Delete Project

  Scenario:
    When I visit the "Project" Page for Project "test 1"
    And  I click the "Delete" link
    Then the system informs me of the operation's success stating "Project was successfully destroyed."

  Scenario:
    When I visit the "Edit Project" Page for Project "test 1"
    And  I click the "Delete" link
    Then the system informs me of the operation's success stating "Project was successfully destroyed."
