Feature: Register Feature

  As a User I want to be

  Background: I am on Start Page
    Given I am on Start Page
    When I click "Register" link
    Then I am on Registraion Page

  Scenario Outline: Registration
    When I fill up registration fields
    And Click "Commit" button
    Then I have flash-notice