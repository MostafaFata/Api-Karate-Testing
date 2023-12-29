
Feature: Get all accounts

  Background: Setup
    Given url BASE_URL
    And path "/api/token"
    * def username = "supervisor"
    * def password = "tek_supervisor"
    And request { "username" : "#(username)", "password" : "#(password)" }
    When method post
    And print response
    Then status 200
    * def validToken = "Bearer " + response.token


  Scenario: Get all accounts from /api/accounts/get-all-accounts
    And path "/api/accounts/get-all-accounts"
    And header Authorization = validToken
    When method get
    And print response
    Then status 200

  Scenario: Get account by Id from /api/accounts/get-account
    And path "/api/accounts/get-account"
    And header Authorization = validToken
    * def primaryId = 2365
    And param primaryPersonId = primaryId
    When method get
    And print response
    Then status 200
    And assert response.primaryPerson.id == primaryId