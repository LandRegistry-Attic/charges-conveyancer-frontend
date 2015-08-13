@add_borrowers_to_case

Feature: Add Borrowers to Case
    As a lender/conveyancer  for a remortgage
    I want to fill in my clients details
    So that I have them on my records

Background:
    Given I navigate to the conveyancer frontend "/cases" page
    And I click on the "Create a new case" link

Scenario: Access Add Borrower Page

    Details to be entered are:-
    - First name
    - Middle name(s)
    - Last name
    - Address
    - Mobile telephone number
    - Email address

    When I click on the "Add a borrower to this case" link
    Then the "Add a borrower" page is displayed
    And all of a borrowers details can be entered

Scenario: Add Borrower to a Case

    - User must be able to save borrower information entered
    - Entered borrowers displayed on create case page
    - Entered borrowers names must be displayed on case list

    When I add the following borrower to a case:
      | first name  | middle name | last name | address                           | mobile number | email address     |
      | Sarah       | Jane        | Smith     | 83 Lordship Park, London, N16 5UP | 07991666999   | sjsmith@gmail.com |
    Then the "Create case" page is displayed
    And the borrowers details are displayed
    When I click on the "Create case" button
    Then the borrower "Sarah Jane Smith" is displayed in the case list

Scenario Outline: Try to Add a Borrower without all Mandatory Information

    - Each client must have a first and last name
    - Each client must have an address
    - Each client must have one mobile phone number
    - Each client must have one email address

    When I click on the "Add a borrower to this case" link
    And I fill in all the details except for <mandatory field>
    And I click on the "Add borrower to case" button
    Then a "All mandatory fields must be completed" message is displayed

    Examples:
    | mandatory field   |
    | first-name        |
    | last-name         |
    | address           |
    | mobile-number     |
    | email-address     |
