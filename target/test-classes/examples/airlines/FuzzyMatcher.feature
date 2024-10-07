Feature: Fuzzy matcher

  @ignore
  Scenario: fuzzy matcher1
    * def json =
      """
      {
        "id": "123",
        "dob" : 1991
      }
      """
    * match json.id == "123"
    * match json.id == '#string'
    * match json.dob == '#number'
    * match json.id == '#regex [0-9]{3}'
    * match json.id == '#regex \\d{3}'
    * match (json.dob + "") == '#regex \\d{4}'

  @ignore
  Scenario: fuzzy matcher2
    * def json =
      """
      {
        "id": "123",
        "dob" : 1991
      }
      """
    * match json ==
      """
      {
        "id": "#present",
        "dob" : '#ignore'
      }
      """

  Scenario: fuzzy matcher3
    * def json =
      """
      {
        "id": 123,
        "name" : "chandra",
        "isManager" : false,
        "skills":[
          "java",
          "testing"
        ]
      }
      """
    * match json.skills == '#array'
    * match json.skills == '#[]'
    * match json.skills == '#[2]'
    * match json.skills == '#[] #string'
    * match json.skills == '#? _[0] == "java"'
    * match json.skills == '#? _[0].length == 4'