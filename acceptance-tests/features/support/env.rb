################################################################################
### This file contains the global variables for the various endpoints used   ###
### in acceptance tests, this abstracts the urls so that you will not        ###
### need to change every test when switching environments for example.       ###
################################################################################

$CHARGES_URL = (
  ENV['CONVEYANCER_FE_URL'] || 'http://conveyancer-frontend.dev.service.gov.uk'
)

$CASE_API_URL = (
  ENV['CASE_API_URL'] || 'http://case-api.dev.service.gov.uk'
)

$BORROWER_FRONTEND_URL = (
  ENV['BORROWER_FRONTEND_URL'] || 'http://borrower-frontend.dev.service.gov.uk'
)

$DEED_API_URL = (
  ENV['DEED_API_URL'] || 'http://deedapi.dev.service.gov.uk'
)
