@US31

Feature: Conveyancer Views Case List
  As a Lender/Conveyancer
  I want to view my current case list
  So that I can view the status of my applications

Acceptance Criteria:
  - URL will take user to case list and display the following:
  - Status
  - Last updated date

Background:
  Given I view the case list
  And I have added values to the case_api

Scenario: Case list is displayed
  When I navigate to the conveyancer frontend "/cases" page
  Then check if it has more or equal the number of rows I added
  Then check if it has the rows I added
  Then I cleanup the case_api

Scenario: Case list is sorted by last updated date
  Then the case list is sorted by last updated date
