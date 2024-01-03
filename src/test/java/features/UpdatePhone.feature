Feature: Update phone number

  Scenario: update phone number via /api/accounts/update-account-phone
    Given url BASE_URL
    And path "/api/token"
    And request {"username": "supervisor", "password": "tek_supervisor"}
    And method post
    Then status 200
    And print response
    * def token = "Bearer " + response.token
    And path "/api/accounts/update-account-phone"
    And header Authorization = token
    And param primaryPersonId = 2348
    And request
    """
    {
      "id": 2348,
      "phoneNumber": "(206)1112222",
      "phoneExtension": "+1",
      "phoneTime": "Day",
      "phoneType": "Cell"
    }
    """
    And method put
    And status 200
    And print response