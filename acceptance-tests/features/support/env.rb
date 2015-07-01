################################################################################
### This file contains the global variables for the various endpoints used   ###
### in acceptance tests, this abstracts the urls so that you will not        ###
### need to change every test when switching environments for example.       ###
################################################################################

$CHARGES_URL = (ENV['CONVEYANCER_FE_URL'] || 'http://0.0.0.0:5000')
$CASE_API_URL = (ENV['CASE_API_URL'] || 'http://0.0.0.0:8000')
