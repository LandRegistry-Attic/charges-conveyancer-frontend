################################################################################
### This file contains any code that should be executed before and after     ###
### the acceptance tests are run, this could include things like taking a    ###
### screenshot if a scenario fails or getting through any initial            ###
### authentication for the app before running the tests.                     ###
################################################################################

### Code that should be executed before the acceptance tests have run.
Before do
  $TEST_DATA = []
end

### Code that should be executed once all of the acceptance tests have run.
After do |scenario|
  ### If an acceptance test scenario has failed then take a screenshot to
  ### record where in the scenario it occured.
  save_screenshot("sshot-#{Time.new.to_i}.png", full: true) if scenario.failed?

  ### Delete all test data that has been created for this scenario
  $TEST_DATA.each { |data|
    delete_case_data(data['id'])
  }
end
