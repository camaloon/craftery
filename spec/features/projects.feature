Feature: Managing projects
  Background:
    Given there are a couple of projects in the system

  Scenario:
    When a user fills the new project form
    Then a new project should be created

  Scenario:
    When a user visits the home page
    Then the list of projects should be displayed
