Feature: test airline
  Scenario: test get airline
    Given url 'https://api.instantwebtools.net'
    And path '/v1/airlines'
    And path '/459a01fe-57d4-4bc7-9692-3a4568bca4e6'
    And header X-Request-id = "Test123"
    And method get
    And print responseStatus
    Then status 200
    Then match responseStatus == 200
    Then assert responseStatus == 200
    Then print "Response status=" + responseStatus
    Then match response == {"_id":"459a01fe-57d4-4bc7-9692-3a4568bca4e6","name":"Emirates","country":"United Arab Emirates","logo":"https://example.com/logos/emirates.png","slogan":"Fly Better","head_quaters":"Garhoud, Dubai","website":"https://www.emirates.com","established":"1985"}
    Then match $ == {"_id":"459a01fe-57d4-4bc7-9692-3a4568bca4e6","name":"Emirates","country":"United Arab Emirates","logo":"https://example.com/logos/emirates.png","slogan":"Fly Better","head_quaters":"Garhoud, Dubai","website":"https://www.emirates.com","established":"1985"}
    Then match response.name == "Emirates"
    Then match $.name == "Emirates"
    Then print responseHeaders
    Then print responseHeaders["Content-Type"]
    Then assert responseHeaders["Content-Type"][0] == "application/json; charset=utf-8"
    Then match header Content-Type == "application/json; charset=utf-8"
    Then match header Content-Type contains "application/json"
    Then match karate.response.header('content-type') contains "application"
