Feature: Tests demo.redmine.org

  As a User I want to be

  Background: I am on Start Page
    Given I am on Start Page


  Scenario: 1.Registration
    When I click "Register" link
    Then I am on Registraion Page
    When I fill up registration fields
    And I Click "commit" name button
    Then I see message "flash_notice" message


  Scenario: 2. LogIn + LogOut
    When I login with "ivanello" login
    And I Click "login" name button
    Then I see message "user" tag a
    And I Click "logout" class button
    Then I see message "login" tag a

  Scenario: 3. Change Password
    When I login with "ivanello" login
    And I Click "login" name button
    And I Click "my-account" class button
    And I Click "icon-passwd" class button
    And I puts old and new pass twice
    And I Click "commit" name button
    Then I see message "flash_notice" message
    And I Click "icon-passwd" class button
    And I puts old and new pass twice back
    And I Click "commit" name button
    Then I see message "flash_notice" message

