Feature: callable


  Scenario: callable get token
    * def username = 'chandra'
    * def password = 'vimal'
    Given url 'https://api.sirv.com/v2/token'
    When request
      """
      {
        "clientId": "SZPOckPrJx4B6HGE1hofP49xGxB",
        "clientSecret": "BXY7ccVfxRN+kdLRUTNYJYaDS98cZZFrDKu+KtQbBLoVSKQlyWWgR0hSGUL3xw6sSug5PxlI/ZVkwckWTn699A=="
      }
      """
    Then method post