@verify
Feature: Verify Token

  Scenario: verifying the token is valid via /api/token/verify
    Given url BASE_URL
    And path "/api/token"
    And request { "username" : "supervisor", "password" : "tek_supervisor" }
    When method post
    And print response
    Then status 200
    And path "/api/token/verify"
    And param token = response.token
    And param username = "supervisor"
    When method get
    And print response
    And assert response.httpStatus == "OK"
    Then status 200