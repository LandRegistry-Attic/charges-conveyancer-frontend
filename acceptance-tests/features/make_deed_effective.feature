@make_deed_effective

Feature: Make Deed Effective
    As a Conveyancer I want to be able to make a deed effective
    So that it is ready for submission to Land Registry

Background:

    Given the conveyancer has created the following deed:
    """
    {
      "id": "1",
      "mdref": "MD0149A",
      "title": {
          "title-number": "GHR67832",
          "address": {
              "street-address": "18 Lordly Place",
              "extended-address": "",
              "locality": "London",
              "postal-code": "N12 5TN"
          }
      },
      "lender": {
          "name": "Bank of England PLC",
          "company-number": "2347672",
          "address": {
              "street-address": "12 Trinity Place",
              "extended-address": "Regents Street",
              "locality": "London",
              "postal-code": "NW10 6TQ"
          }
      },
      "borrowers": [
          {
              "id": "1",
              "name": "Peter Smith",
              "address": {
                  "street-address": "83 Lordship Park",
                  "extended-address": "",
                  "locality": "London",
                  "postal-code": "N16 5UP"
              }
          }
      ],
      "restrictions": [
          "This is my restriction"
      ],
      "provisions": [
          "This Mortgage Deed incorporates the Lenders Mortgage Conditions and Explanation 2006, a copy of which has been received by the Borrower.",
          "The lender is under an obligation to make further advances and applies for the obligation to be entered in the register.",
          "No disposition of the registered estate by the proprietor of the registered estate is to be registered without a written consent signed by Bank of England Plc."
      ]
    }
    """
    And the conveyancer has created a case that is linked to a deed
    And I navigate to the borrower frontend "/deed/search" page
    And I have signed my mortgage deed as "Peter Smith"

Scenario: Conveyancer Makes a Deed Effective

    - Only show Confirm completion button on case list only if the deed has been fully signed
    - Once marked complete a case should be shown as Completion Confirmed as the status

    Given I navigate to the conveyancer frontend "/cases" page
    When I click on the Confirm completion link
    And I click on the "Confirm completion" button
    Then the "Case list" page is displayed
    And the status for the case is "Completion confirmed"
