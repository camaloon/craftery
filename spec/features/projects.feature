Feature: Managing Projects

  Background:
    Given the following Users exist in the system
      | Username | Name         | Password |
      | paco     | paco pruebas | 1234     |
    And I am identified in the system as "paco" using password "1234"
    And the following Projects exist in the system
      | Name       | Description                        |
      | craftery   | a really cool project!             |
      | worldfixer | fix the world with just one click! |

# Home page

  Scenario:
    When I visit the "Root" Page
    Then the page shows
      | Content                            |
      | Craftery                           |
      | a really cool project!             |
      | Worldfixer                         |
      | fix the world with just one click! |

# Project Details

  Scenario:
    When I visit the "Root" Page
    And  I click on "Craftery" for Project "craftery" in the List
    Then the page shows
      | Content                |
      | Craftery               |
      | a really cool project! |
      | Personas               |

# New Project

  Scenario:
    When I visit the "Root" Page
    And  I click on "New Project"
    Then a form with the following fields is displayed
      | Field       |
      | * Name      |
      | Description |

  Scenario:
    When I visit the "New Project" Page
    And  I fill the text values of the form as follows
      | Field  | Value  |
      | * Name | a name |
    And  I click on "Create Project"
    Then the system informs me of the operation's success stating "Project was successfully created."

# Edit Project

  Scenario:
    When I visit the "Root" Page
    And  I click on "Edit Project" for Project "craftery" in the List
    Then a form with the following fields is displayed
      | Field       | Value                  |
      | * Name      | craftery               |
      | Description | a really cool project! |

  Scenario:
    When I visit the "Project" Page for Project "craftery"
    And  I click on "Edit"
    Then a form with the following fields is displayed
      | Field       | Value                  |
      | * Name      | craftery               |
      | Description | a really cool project! |

  Scenario:
    When I visit the "Edit Project" Page for Project "craftery"
    And  I modify the text values of the form as follows
      | Field       | Value             |
      | * Name      | a new name        |
      | Description | a new description |
    And  I click on "Update Project"
    Then the system informs me of the operation's success stating "Project was successfully updated."
    And  the page shows
      | Content           |
      | A new name        |
      | a new description |

# Delete Project

  Scenario:
    When I visit the "Project" Page for Project "craftery"
    And  I click on "Delete"
    Then the system informs me of the operation's success stating "Project was successfully destroyed."

  Scenario:
    When I visit the "Edit Project" Page for Project "craftery"
    And  I click on "Delete"
    Then the system informs me of the operation's success stating "Project was successfully destroyed."
