Feature: Managing Features

  Background:
    Given the following Users exist in the system
      | Username | Name         | Password |
      | paco     | paco pruebas | 1234     |
    And I am identified in the system as "paco" using password "1234"
    And the following Projects exist in the system
      | Name     | Description            |
      | craftery | a really cool project! |
    And the project "craftery" has the following Features
      | Name          | Owner | State  | Description                           |
      | mind blowness | paco  | draft  | the interface has to blow users mind! |
      | markdown      | paco  | frozen | the editors should support markdown   |

  Scenario:
    When I visit the "Project" Page for Project "craftery"
    Then the page shows
      | Content                               |
      | Mind blowness                         |
      | Paco                                  |
      | draft                                 |
      | the interface has to blow users mind! |
      | Markdown                              |
      | frozen                                |
      | the editors should support markdown   |

# Feature Details

  Scenario:
    When I visit the "Project" Page for Project "craftery"
    And  I click on "Mind blowness" for Feature "mind blowness" in the List
    Then the page shows
      | Content                               |
      | Mind blowness                         |
      | paco                                  |
      | draft                                 |
      | the interface has to blow users mind! |
      | User Stories                          |
      | Business Goals                        |

# New Feature

  Scenario:
    When I visit the "Project" Page for Project "craftery"
    And  I click on "New Feature"
    Then a form with the following fields is displayed
      | Field       |
      | * Name      |
      | Description |

  Scenario:
    When I visit the "New Project Feature" Page for Project "craftery"
    And  I fill the text values of the form as follows
      | Field  | Value  |
      | * Name | a name |
    And  I click on "Create Feature"
    Then the system informs me of the operation's success stating "Feature was successfully created."

# Edit Feature

  Scenario:
    When I visit the "Project" Page for Project "craftery"
    And  I click on "Edit Feature" for Feature "mind blowness" in the List
    Then a form with the following fields is displayed
      | Field       | Value                                 |
      | * Name      | mind blowness                         |
      | Description | the interface has to blow users mind! |

  Scenario:
    When I visit the "Feature" Page for Feature "mind blowness"
    And  I click on "Edit"
    Then a form with the following fields is displayed
      | Field       | Value                                 |
      | * Name      | mind blowness                         |
      | Description | the interface has to blow users mind! |

  Scenario:
    When I visit the "Edit Feature" Page for Feature "mind blowness"
    And  I modify the text values of the form as follows
      | Field       | Value             |
      | * Name      | a new name        |
      | Description | a new description |
    And  I click on "Update Feature"
    Then the system informs me of the operation's success stating "Feature was successfully updated."
    And  the page shows
      | Content           |
      | A new name        |
      | a new description |

# Delete Feature

  Scenario:
    When I visit the "Feature" Page for Feature "mind blowness"
    And  I click on "Delete"
    Then the system informs me of the operation's success stating "Feature was successfully destroyed."

  Scenario:
    When I visit the "Edit Feature" Page for Feature "mind blowness"
    And  I click on "Delete"
    Then the system informs me of the operation's success stating "Feature was successfully destroyed."
