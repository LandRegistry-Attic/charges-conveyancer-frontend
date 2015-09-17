@use_real_case_details

Feature: Retrieve Deed details with actual borrower and property details
    In order to join up the Create Case and Create Deed journeys when creating a Deed
    the Deed API should create a Deed using the actual borrower and property details
    in the case (rather than hardcoded test data)

Background:
    Given I have created a Case with two borrowers and an asscociated deed


Scenario: Ensure the borrower and property details that appear on the Deed,
    are those that are entered when creating the case.

    When I retrieve the deed
    Then the correct borrower details are returned
    And the correct property details are returned
