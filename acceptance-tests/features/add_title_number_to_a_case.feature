@add_title_number_to_a_case

Feature: Add Title Number to Case
  As a Conveyancer/lender
  I want add a title number to my case list
  So that I can register the borrowers mortgage

Background:
  Given I have created a new case


Scenario: Add invalid Title Number to a Case
    When I select to add a property to the case
    And I enter an invalid title number
    Then an error message is displayed to the user


Scenario: Add Title Number to a Case
  When I select to add a property to the case
  And I enter a title number
  Then the title number is returned
  And address consists of street address, extended address, locality and postcode
  And the tenure associated with the title number is returned
  And the selected property address details are re-displayed
  And the add title number button is no longer available
