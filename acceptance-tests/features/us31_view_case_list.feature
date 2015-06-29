@US31

Feature: Conveyancer Views Case List
    As a Lender/Conveyancer
    I want to view my current case list
    So that I can view the status of my applications

Acceptance Criteria:
    - URL will take user to case list and display the following:
      - Reference
      - Client
      - Task
      - Status
      - Last updated date
    - List of cases will be sorted by last updated date (newest first)

Background:
    Given I have created a case
    And I navigate to the case list page

Scenario: Case list is displayed
    Then the case reference number is displayed
    And the client is displayed
    And the task is displayed
    And the status is displayed
    And the last updated date is displayed

Scenario: Case list is sorted by last updated date
    Then the case list is sorted by last updated date
