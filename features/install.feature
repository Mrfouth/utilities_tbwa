@disable-bundler
Feature: Install utilities_tbwa files

  Scenario: UtilitiesTbwa generates a new utilities_tbwa installation
    When I run `bundle exec utilities_tbwa install`
    Then the sass directories should have been generated
    And the following directories should exist:
      | utilities_tbwa     |
    And the master utilities_tbwa partial should have been generated
    And the output should contain "UtilitiesTbwa files installed to utilities_tbwa/"

  Scenario: Generating does not overwrite an existing utilities_tbwa directory
    Given utilities_tbwa is already installed
    When I run `bundle exec utilities_tbwa install`
    Then the output should contain "UtilitiesTbwa files already installed, doing nothing."

  Scenario: Install UtilitiesTbwa into a custom path
    When I run `bundle exec utilities_tbwa install --path=custom_path`
    Then the sass directories with "custom_path" prefix should have been generated
    And the following directories should exist:
      | custom_path/utilities_tbwa     |
    And the master utilities_tbwa partial should have been generated within "custom_path" directory
    And the output should contain "UtilitiesTbwa files installed to custom_path/utilities_tbwa/"

  Scenario: Forcing install of utilities_tbwa
    Given utilities_tbwa is already installed
    When I run `bundle exec utilities_tbwa install --force`
    Then the output from "bundle exec utilities_tbwa install --force" should contain "UtilitiesTbwa files installed to utilities_tbwa/"
    And the output should not contain "UtilitiesTbwa files already installed, doing nothing."
