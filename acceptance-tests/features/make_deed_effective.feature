@make_deed_effective

Feature: Make Deed Effective
    As a Conveyancer I want to be able to make a deed effective
    So that it is ready for submission to Land Registry

Scenario: Conveyancer Makes a Deed Effective

    - Only show Confirm completion button on case list only if the deed has been fully signed
    - Once marked complete a case should be shown as Completion Confirmed as the status

    Given I have a deed which all borrowers have signed
    And I navigate to the conveyancer frontend "/cases" page
    When I click on the "Confirm completion" link
    And I click on the "Confirm completion" link
    Then the "Case list" page is displayed
    And the status of the case is "Completion confirmed"









Scenario: Date applied signature applied when make deed effective

    - Date must be added to the deed which consists of time stamp (current datetime)
    - The "registrars" signature must be applied to the deed on making it effective

    Given I make the deed effective
    When I get the deed form the api
    Then the signature is applied to the deed
    And the date is applied to the deed

Scenario: Unable to change deed data once it has been made effective

    - Once deed has been made effective, it must locked and no further changes allowed (i.e. any endpoint that updates the deed needs to check whether the deed has been "locked" by the registrar before applying the change to the DB)

    Given I make the deed effective
    When I update the status
    Then I should get a 403 response
