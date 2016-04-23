Feature: login to Firefox and Sarafi

  Scenario: login to both web browsers
    Given I turn on the "firefox" and login
    And I turn on the "chrome" and login
#    Then I should see all zero in "source"
