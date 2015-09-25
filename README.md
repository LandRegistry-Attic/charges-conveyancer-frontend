# Conveyancer Frontend

The Conveyancer Frontend provides a way for Conveyancers to create Mortgage deeds and send them to Borrowers to be signed.


## Contents
- [Usage](#usage)
- [Getting Started](#getting-started)
- [Testing](#testing)

## Usage
GET/POST    /case/<case_id>/borrower/new                # add borrower to a case
GET         /cases                                      # get all cases
GET/POST    /case/new                                   # add a new case
GET/POST    /case/<case_id>/deed/<deed_id>/completion   # confirm case completion
GET/POST    /case/<case_id>/application                 # submit a case
GET/POST    /case/<case_id>/deed/new                    # create a new deed

## Getting started

Get the git submodules
```
git submodule init
git submodule update
```

Install the requirements
```
pip install -r requirements.txt
pip install -r requirements_test.txt
```

To run the application run the command
```
python run.py runserver
```


## Testing

### Unit tests

Run the unit tests
```
python tests.py
```

### Acceptance tests

All of the acceptance tests are contained within the acceptance-tests folder with the feature files under the features folder and the step-definitions under the steps folder.

If you would like to run all of the acceptance tests then navigate into the acceptance-tests folder and run the following command:

```
./run_tests.sh
```

You can also pass arguments to this command as you would if you were just running cucumber on it's own.

For example you can use the following command to display a cut down version of cucumbers progress when it is running:

```
./run_tests.sh --format progress
```

Or you can use the following to run only the scenarios that have been tagged with whatever tags you specify:

```
/run_tests.sh --tags @USXX
```

### Running Rubocop

Rubocop is ruby gem that will check any ruby code in the repository against the ruby style guide and then provide a report of any offenses.

In order to run Rubocop on the acceptance test code then navigate into the acceptance test folder and run the command:

```
./run_linting.sh
```

If you wish to amend what cops are used, what files are ignored when running Rubocop then you will need to put this in the rubocop.yml file.
