@add_ref_to_case

Feature: Add Reference to Case
  As a conveyancer who has many cases to track I need to be able to mark a case
  with an internal reference so that I can identify exactly which case on my
  list matches my own internal case list

Scenario Outline: Conveyancer Enters Reference

  - If a case reference is provided then it will be displayed on the case list

  Given I view the case list
  And I click on the "Create a new case" button
  When I enter the case reference <reference>
  And I click on the "Create case" button
  Then the "Case list" page is displayed
  And the reference <reference> is displayed in the case list

  Examples:
    | reference                                       |
    | "A"                                             |
    | "XYZ123"                                        |
    | "13 High Street, Ernesettle, Plymouth, PL3 8JN" |

Scenario: Conveyancer Doesn't Enter a Reference

  - If no reference is provided then the field on the case list will be blank

  Given I view the case list
  And I click on the "Create a new case" button
  When I leave the case reference field blank
  And I click on the "Create case" button
  Then the "Case list" page is displayed
  And no reference is displayed in the case list

Scenario: Conveyancer Cancels Case Creation

  - Clicking the cancel button returns to the case list

  Given I view the case list
  And I click on the "Create a new case" button
  When I click on the "Cancel" link
  Then the "Case list" page is displayed
  And no new case has been created
