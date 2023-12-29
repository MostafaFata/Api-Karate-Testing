@api
Feature: Generating token against different scenarios

  Scenario Outline: Generating a valid token from /api/token
    Given url BASE_URL
    And path "/api/token"
    And request { "username" : "<username>", "password" : "<password>" }
    When method post
    And print response
    Then status <status>
    Examples:
    | username | password | status |
    | supervisor | tek_supervisor | 200 |
    | admin | tek_supervisor | 404 |
    | supervisor | random | 400 |