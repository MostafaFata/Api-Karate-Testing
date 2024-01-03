Feature: Generate Token

  Scenario: Generating a valid token from /api/token
    Given url BASE_URL
    And path "/api/token"
    And request { "username" : "supervisor", "password" : "tek_supervisor" }
    When method post
    Then status 200
