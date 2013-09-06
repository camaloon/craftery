Feature: Managing Projects
  Background:
    Given there are a couple of Projects in the system

  # Home page

  Scenario:
    When a User visits the Home Page
    Then the List of Projects should be displayed

  # Project Details

  Scenario:
    When a User visits the Home Page
    And  clicks on a Project link in the Project List
    Then the Project details are displayed

  # New Project

  Scenario:
    When a User visits the Home Page
    And  clicks the New Project link
    Then the New Project Form is displayed

  Scenario:
    When a User visits and fills the New Project Form
    Then the User is informed of the operation's success

  # Edit Project

  Scenario:
    When a User visits the Home Page
    And  clicks on an Edit Project Link in the Project List
    Then the Edit Project Form is displayed populated with the Project's values

  Scenario:
    When a User visits the Project's Detail Page for a given Project
    And  clicks on the Edit Project Link
    Then the Edit Project Form is displayed populated with the Project's values

  Scenario:
    When a User visits and modifies some values in the Edit Project Form and saves
    Then the User is informed of the operation's success
    And  the Project Details Page displays with the updated data

  # Delete Project

  Scenario:
    When a User visits the Project's Detail Page for a given Project
    And  clicks on the Delete Project Link
    Then the User is informed of the operation's success
