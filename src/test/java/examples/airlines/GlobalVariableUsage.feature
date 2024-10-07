Feature: Global variable

  Scenario: Global variable usage
    * url airlineUrl
    * def requestPayload = read("jsonFiles/create.json")
    * request requestPayload
    * method post
    * match responseStatus == 200
    * print airlineUrl
    * print someVar