Feature: Create airline

  @ignore
  Scenario: create airline
    * url "https://api.instantwebtools.net/v1/airlines"
    * request
      """
      {
        "_id":"252d3bca-d9bb-476c-9a97-562d685e235c",
        "name": "Sri Lankan Airways",
        "country": "Sri Lanka",
        "logo": "https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Qatar_Airways_Logo.svg/sri_lanka.png",
        "slogan": "From Sri Lanka",
        "head_quaters": "Katunayake, Sri Lanka",
        "website": "www.srilankaaairways.com",
        "established": "1990"
      }
      """
    * method post
    * match responseStatus == 200
    * print response

  @ignore
  Scenario: create airline
    * url "https://api.instantwebtools.net/v1/airlines"
    * def requestPayload = {}
    * requestPayload.name = "Sri Lankan Airways"
    * requestPayload.country = "Sri Lanka"
    * requestPayload.logo = "https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Qatar_Airways_Logo.svg/sri_lanka.png"
    * requestPayload.slogan = "From Sri Lanka"
    * requestPayload.head_quaters = "Katunayake, Sri Lanka"
    * requestPayload.website = "www.srilankaaairways.com"
    * requestPayload.established = "1990"
    * requestPayload.address = []
    * requestPayload.address[0] = {}
    * requestPayload.address[0].city = "lucknow"
    * requestPayload.address[0].state = "UP"
    * requestPayload.address[1] = {}
    * requestPayload.address[1].city = "blr"
    * requestPayload.address[1].state = "ka"
    * request requestPayload
    * method post
    * match responseStatus == 200
    * print response

  @ignore
  Scenario: read json
    * url "https://api.instantwebtools.net/v1/airlines"
    * def requestPayload = read("jsonFiles/create.json")
    * set requestPayload.name = "CP"
    * request requestPayload
    * method post
    * match responseStatus == 200
    * print response
    * remove requestPayload._id
    * request requestPayload
    * method post
    * match responseStatus == 200
    * set requestPayload.ceo = "CP"
    * request requestPayload
    * method post
    * match responseStatus == 200
    * set requestPayload.foo =
      """
      {
        "foo1" : {
          "foo2" : "boo1"
        }
      }
      """
    * request requestPayload
    * method post
    * match responseStatus == 200
    * set requestPayload.foo.foo1.foo2 = "boo2"
    * request requestPayload
    * method post
    * match responseStatus == 200

  Scenario: array
    Given url "https://api.instantwebtools.net/v1/airlines"
    * def requestPayload = read("jsonFiles/create.json")
    * set requestPayload.skills[0] =
      """
      {
        "subject" : "Java"
      }
      """
    * set requestPayload.skills[1] =
      """
      {
        "subject" : "C#"
      }
      """
    * request requestPayload
    * method post
    * match responseStatus == 200

