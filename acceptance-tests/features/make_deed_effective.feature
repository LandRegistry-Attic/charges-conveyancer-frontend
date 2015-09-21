@make_deed_effective

Feature: Make Deed Effective
    As a Conveyancer I want to be able to make a deed effective
    So that it is ready for submission to Land Registry

Background:

    Given I have created a case and deed with one borrower
    And I navigate to the borrower frontend "/deed/search" page
    And I have signed my mortgage deed as "John Hughes"

Scenario: Conveyancer Makes a Deed Effective

    - Only show Confirm completion button on case list only if the deed has been fully signed
    - Once marked complete a case should be shown as Completion Confirmed as the status

    Given I navigate to the conveyancer frontend "/cases" page
    When I click on the Confirm completion link
    And I click on the "Confirm completion" button
    Then the "Case list" page is displayed
    And the status for the case is "Completion confirmed"
