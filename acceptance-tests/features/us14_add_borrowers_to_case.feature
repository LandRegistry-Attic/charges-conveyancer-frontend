@add_borrowers_to_case

Feature: Add Borrowers to Case
    As a lender/conveyancer  for a remortgage
    I want to fill in my clients details
    So that I have them on my records

Scenario: Add a Borrower to a Case Page

    Details to be entered are:-
    - First name
    - Middle name(s)
    - Last name
    - Address
    - Mobile telephone number
    - Email address

    Given I have navigated to the conveyancer frontend "/cases" page
    And I click on the "Create a new case" button
    When I click on the "Add Borrower" link
    Then the "Add borrower" page is displayed
    And the correct fields are displayed

Scenario: Add a borrower

    - User must be able to save borrower information entered
    - Entered borrowers displayed on create case page
    - Entered borrowers names must be displayed on case list

    Given I have navigated to the "add borrower" page
    And I fill in the correct details
    When I click on the "add borrower" button
    Then the borrowers details are displayed on the "create case" page
    And when I click on the "create case" button
    Then the borrowers names are displayed on the case list

Scenario: User tries to add a borrower without a mandatory field

    - Each client must have a first and last name
    - Each client must have an address
    - Each client must have one mobile phone number
    - Each client must have one email address

    Given I have navigated to the "Add borrower" page
    And I fill in all the details except <mandatory field>
    When I click on the add borrower button
    Then a message is displayed stating "all mandatory fields must be completed"

    Examples:
    | first name |
    | last name |
    |address|
    |mobile number|
    |email address|
