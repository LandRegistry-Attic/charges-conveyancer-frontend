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
            },
            {
                "id": "2",
                "name": "Sarah Jane Smith",
                "address": {
                    "street-address": "25 Hanger Lane",
                    "extended-address": "Harrow",
                    "locality": "London",
                    "postal-code": "N11 8RD"
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
      And all borrowers have signed the deed
      And conveyancer has made the deed effective

Scenario: Apply to register a signed deed
  When I select to Apply to register the deed
  Then the status for the case is "Submitted"
