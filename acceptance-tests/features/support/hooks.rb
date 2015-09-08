################################################################################
### This file contains any code that should be executed before and after     ###
### the acceptance tests are run, this could include things like taking a    ###
### screenshot if a scenario fails or getting through any initial            ###
### authentication for the app before running the tests.                     ###
################################################################################

### Code that should be executed before the acceptance tests have run.
Before do
end
### Code that is executed after acceptance tests for each feature have run
After do
  if @deed_id
    puts "Deleting test deed #{@deed_id}"
    delete_deed_data(@deed_id)
  end
  if @case_id
    puts "Deleting test case #{@case_id}"
    delete_case_data(@case_id)
  end
end
