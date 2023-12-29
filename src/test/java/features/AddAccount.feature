@today
Feature: Add account

  Scenario: adding a new account /api/accounts/add-primary-account
    Given url BASE_URL
    * def includedToken = callonce read('Token.feature')
    * def token = "Bearer " + includedToken.response.token
    * def dataGenerator = Java.type('data.DataGenerator')
    * def email = dataGenerator.generateEmail()
    * def fname = dataGenerator.generateFirstname()
    * def lname = dataGenerator.generateLastname()
    And path "/api/accounts/add-primary-account"
    And request
    """
    {
      "id": 0,
      "email": "#(email)",
      "firstName": "#(fname)",
      "lastName": "#(lname)",
      "title": "Mr.",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "string",
      "dateOfBirth": "2023-12-26T01:14:55.519Z",
      "new": true
    }
    """
    And method post
    Then status 201
    And assert response.email == email
    And print response
    * def newId = response.id
    And path "/api/accounts/delete-account"
    And header Authorization = token
    And param primaryPersonId = newId
    And method delete
    Then status 200
    And match response contains
    """
    {
      "status": true,
      "httpStatus": "OK",
      "message": "Account Successfully deleted"
     }
    """

