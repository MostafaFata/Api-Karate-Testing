Feature: Generating Invalid Token

  Scenario: Login to API using wrongusername /api/token
    Given url BASE_URL
    And path "/api/token"
    And request { "username" :  "admin", "password" : "tek_supervisor"}
    When method post
    And print response
    And assert response.httpStatus == "NOT_FOUND"
    And assert response.errorMessage == "User admin not found"
    Then status 404

  Scenario: Login to API using worng password /api/token
    Given url BASE_URL
    And path "/api/token"
    And request { "username" :  "supervisor", "password" : "wrongpassword"}
    When method post
    And print response
    And assert response.httpStatus == "BAD_REQUEST"
    And assert response.errorMessage == "Password not matched"
    Then status 400