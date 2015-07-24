@US63

Feature: Caselist is updated only when all borrowers have signed
    As a Lender/Conveyancer
    I want to know when all borrowers have signed
    So that I know I can continue with the process

Background:
    Given I click on the 'Create a new case' button #will this step be sufficient or need api call?
    And the conveyancer has created the following deed: #need to pull this in from deed_frontend repo
    """
    {
     "id":"1",
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
     "borrowers":[{
       "id": "1",
       "name": "Peter Smith",
       "address": {
         "street-address": "83 Lordship Park",
         "extended-address": "",
         "locality": "London",
         "postal-code": "N16 5UP"
       }, {
       "id": "2",
       "name": "Sarah Jane Smith",
       "address": {
         "street-address": "25 Hanger Lane",
         "extended-address": "Harrow",
         "locality": "London",
         "postal-code": "N11 8RD"
       }
     }],
     "restrictions": ["This is my restriction"],
     "provisions": ["This Mortgage Deed incorporates the Lenders Mortgage Conditions and Explanation 2006, a copy of which has been received by the Borrower.",
       "The lender is under an obligation to make further advances and applies for the obligation to be entered in the register.",
       "No disposition of the registered estate by the proprietor of the registered estate is to be registered without a written consent signed by Bank of England Plc."]
    }
    """

Scenario: When no borrowers have signed the case status is still 'mortgage created'
    When I navigate to the conveyancer frontend "/cases" page
    Then the status for the case is "mortgage created" #this will be a new step definition to check specific row for status text

Scenario: When one of two borrower has signed the case status is still 'mortgage created'
    Given I navigate to the borrower frontend "/deed/search" page #need to pull this in from deed_frontend repo
    And I have signed my mortgage deed as "Peter Smith" #need to pull this in from deed_frontend repo
    When I navigate to the conveyancer frontend "/cases" page
    Then the status for the case is "mortgage created" #this will be a new step definition to check specific row for status text

Scenario: When two of two borrowers have signed the case status is still 'mortgage signed'
    Given I navigate to the borrower frontend "/deed/search" page #need to pull this in from deed_frontend repo
    And I have signed my mortgage deed as "Peter Smith" #need to pull this in from deed_frontend repo
    And I navigate to the borrower frontend "/deed/search" page #need to pull this in from deed_frontend repo
    And I have signed my mortgage deed as "Sarah Jane Smith" #need to pull this in from deed_frontend repo
    When I navigate to the conveyancer frontend "/cases" page
    Then the status for the case is "mortgage signed" #this will be a new step definition to check specific row for status text
