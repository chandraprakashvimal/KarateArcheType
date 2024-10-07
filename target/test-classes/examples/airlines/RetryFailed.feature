Feature: retry

  @ignore
  Scenario: retry
    Given url 'https://api.sirv.com/v21/token'
    When request
      """
      {
        clientId: 'SZPOckPrJx4B6HGE1hofP49xGxB',
        clientSecret: 'BXY7ccVfxRN+kdLRUTNYJYaDS98cZZFrDKu+KtQbBLoVSKQlyWWgR0hSGUL3xw6sSug5PxlI/ZVkwckWTn699A=='
      }
      """
    And retry until responseStatus ==200
    Then method post
    And status 200

    
  Scenario: retry custom
    * configure retry = {count : 5, interval : 5000}
    Given url 'https://api.sirv.com/v21/token'
    When request
      """
      {
        clientId: 'SZPOckPrJx4B6HGE1hofP49xGxB',
        clientSecret: 'BXY7ccVfxRN+kdLRUTNYJYaDS98cZZFrDKu+KtQbBLoVSKQlyWWgR0hSGUL3xw6sSug5PxlI/ZVkwckWTn699A=='
      }
      """
    And retry until responseStatus ==200
    Then method post
    And status 200
