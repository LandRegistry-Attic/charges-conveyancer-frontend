@US07

Feature: Conveyancer applys to register
  As a Lender/Conveyancer
  I want to apply to register the signed mortgage deed
  So that it can be applied to the register

Acceptance Criteria:
  - case list shows application has been submitted
  - user is unable to resubmit an application once it has been submitted
  - database reflects submitted state
  - Deed must have a status of "completion confirmed" before it can be submitted

Background:
  Given I have created a case and deed with two borrowers that is signed

@delete_test_data
Scenario: Apply to register a signed deed
  Given the conveyancer has made the deed effective
  When I select to Apply to register the deed
  Then the status for the case is "Submitted"
