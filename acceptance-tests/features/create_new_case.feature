@create_new_case

Feature: Create case and deed helper page
  In order to be able to provide an interactive demo at Sprint planning
  the team want the Conveyancer Frontend
  to have a page that will let them easily create a deed and a case for test purposes

Scenario: Go to the create case page
    Given I navigate to the conveyancer frontend "/cases" page
    When I click on the "Create a new case" link
    Then the "Create a new case" page is displayed

Scenario: Create a case
    Given I am on the Create a new case page
    When I click on the "Create case" button
    Then the "Case list" page is displayed
    And a new case has been added to the case list
