Feature: Managing User Stories

  Background:
    Given the following Users exist in the system
      | Username | Name         | Password |
      | paco     | paco pruebas | 1234     |
    And I am identified in the system as "paco" using password "1234"
    And the following Projects exist in the system
      | Name     | Description            |
      | craftery | a really cool project! |
    And the project "craftery" has the following Features
      | Name          | Owner | State | Description                           |
      | mind blowness | paco  | draft | the interface has to blow users mind! |
    And the project "craftery" has the following Personas defined
      | Name  |
      | User  |
      | Admin |
    And the feature "mind blowness" has the following User Stories
      | Author | Persona | Desire                        | Benefit               |
      | paco   | User    | see important buttons in blue | spot them at a glance |

# TODO: Test User Story list (see also features and project)

# User Story Details

  Scenario:
    When I visit the "Feature" Page for Feature "mind blowness"
    And  I click the Title Link for the first "User Story" in the List
    Then the page shows
      | Content                       |
      | paco                          |
      | As a                          |
      | User                          |
      | I want to                     |
      | see important buttons in blue |
      | So I                          |
      | spot them at a glance         |

# New User Story

  Scenario:
    When I visit the "Feature" Page for Feature "mind blowness"
    And  I click on "New User Story"
    Then a form with the following fields is displayed
      | Field       |
      | * As a      |
      | * I want to |
      | * So I      |

  Scenario:
    When I visit the "New Feature User Story" Page for Feature "mind blowness"
    And  I fill the text values of the form as follows
      | Field       | Value                 |
      | * I want to | create projects       |
      | * So I      | can track them easily |
    And  I select the following values from the combo boxes of the form
      | Field  | Value |
      | * As a | User  |
    And  I click on "Create User story"
    Then the system informs me of the operation's success stating "User story was successfully created."

# Edit User Story

  Scenario:
    When I visit the "Feature" Page for Feature "mind blowness"
    And  I click on "Edit User Story" for the first "User Story" in the List
    Then a form with the following fields is displayed
      | Field       | Value                         |
      | * As a      | User                          |
      | * I want to | see important buttons in blue |
      | * So I      | spot them at a glance         |

  Scenario:
    When I visit the "Feature" Page for Feature "mind blowness"
    And  I click the Title Link for the first "User Story" in the List
    And  I click on "Edit"
    Then a form with the following fields is displayed
      | Field       | Value                         |
      | * As a      | User                          |
      | * I want to | see important buttons in blue |
      | * So I      | spot them at a glance         |

  Scenario:
    When I visit the "Feature" Page for Feature "mind blowness"
    And  I click on "Edit User Story" for the first "User Story" in the List
    And  I modify the text values of the form as follows
      | Field       | Value                            |
      | * I want to | delete projects                  |
      | * So I      | blow more abusing users minds ;p |
    And  I select the following values from the combo boxes of the form
      | Field  | Value |
      | * As a | Admin |
    And  I click on "Update User story"
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
    And  I click on "Delete User Story" for the first "User Story" in the List
    Then the system informs me of the operation's success stating "User story was successfully destroyed."

  Scenario:
    When I visit the "Feature" Page for Feature "mind blowness"
    And  I click the Title Link for the first "User Story" in the List
    And  I click on "Delete"
    Then the system informs me of the operation's success stating "User story was successfully destroyed."

  Scenario:
    When I visit the "Feature" Page for Feature "mind blowness"
    And  I click on "Edit User Story" for the first "User Story" in the List
    And  I click on "Delete"
    Then the system informs me of the operation's success stating "User story was successfully destroyed."

