@add_borrowers_to_case

Feature: Add Borrowers to Case
    As a lender/conveyancer  for a remortgage
    I want to fill in my clients details
    So that I have them on my records

Background:
    Given I navigate to the conveyancer frontend "/cases" page
    And I click on the "Create a new case" link
    And I click on the "Create case" button

Scenario: Access Add Borrower Page

    Details to be entered are:-
    - First name
    - Middle name(s)
    - Last name
    - Address
    - Mobile telephone number
    - Email address

    When I click on the "Add borrower" link
    Then the "Add a borrower" page is displayed
    And all of a borrowers details can be entered

Scenario: Add Borrower to a Case

    - User must be able to save borrower information entered
    - Entered borrowers displayed on create case page
    - Entered borrowers names must be displayed on case list

    When I add the following borrowers to a case:
      | FIRST NAME  | MIDDLE NAME | LAST NAME | STREET ADDRESS    | EXTENDED ADDRESS  | LOCALITY  | POSTCODE  |  MOBILE NUMBER  | EMAIL ADDRESS     |
      | Sarah       | Jane        | Smith     | 83 Lordship Park  |                   | London    | N16 5UP   | 07991666999     | sjsmith@gmail.com |
    Then the "Create details" page is displayed
    And the borrowers details are displayed
    When I click on the "Cancel" link
    Then the borrower "Sarah Jane Smith" is displayed in the case list

Scenario Outline: Try to Add a Borrower without all Mandatory Information

    - Each client must have a first and last name
    - Each client must have an address
    - Each client must have one mobile phone number
    - Each client must have one email address

    When I click on the "Add borrower" link
    And I fill in all borrower details except for <MANDATORY FIELD ID>
    And I click on the "Add borrower" button
    Then a message is displayed stating you didnt enter <MANDATORY FIELD NAME>

    Examples:
    | MANDATORY FIELD NAME    | MANDATORY FIELD ID    |
    | "First name"            | "first_name"          |
    | "Last name"             | "last_name"           |
    | "Street address"        | "street_address"      |
    | "Locality"              | "locality"            |
    | "Postcode"              | "postcode"            |
    | "Mobile number"         | "mobile_no"           |
    | "Email address"         | "email_address"       |
