@US22 @add_title_number_to_a_case

Feature: Add Title Number to Case
  As a Conveyancer/lender
  I want add a title number to my case list
  So that I can register the borrowers mortgage

Acceptance criteria:
  - Must be able to add a title number to case
  - Title number lookup must return street address, extended address, locality and postcode
  - Title number lookup must return tenure
  - Must only be able to add ONE title number to the case
  - Error message must be displayed if title number is invalid
  - Must be able to save the property details in the case
  - Entered address details must be displayed on case details page

Background:
  Given I have created a new case
  When I select to add a property to the case


Scenario: Add invalid Title Number to a Case
  When I enter an invalid title number
  Then an invalid Title Number error message is displayed to the user


Scenario: Add Title Number to a Case
  When I enter a title number
  And select the returned property
  Then the correct address details are displayed
  And the selected property address details are re-displayed
  And the add title number button is no longer available
