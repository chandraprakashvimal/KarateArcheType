Feature: reuse feature file

  @ignore
  Scenario: callable1
    * def data = call read('callable1.feature')
    * print data
    * print data.password

  @ignore
  Scenario: callable2
    * def data = call read('callable2.feature')
    * print data
    * print data.response.token

  @ignore
  Scenario: callable3
    * def clientId = 'SZPOckPrJx4B6HGE1hofP49xGxB'
    * def clientSecret = 'BXY7ccVfxRN+kdLRUTNYJYaDS98cZZFrDKu+KtQbBLoVSKQlyWWgR0hSGUL3xw6sSug5PxlI/ZVkwckWTn699A=='
    * def data = call read('callable3.feature')
    * print data
    * print data.response.token

  @ignore
  Scenario: callable3
    * def clientId1 = 'SZPOckPrJx4B6HGE1hofP49xGxB'
    * def clientSecret1 = 'BXY7ccVfxRN+kdLRUTNYJYaDS98cZZFrDKu+KtQbBLoVSKQlyWWgR0hSGUL3xw6sSug5PxlI/ZVkwckWTn699A=='
    * def data = call read('callable3.feature') {clientId1: '#(clientId1)', clientSecret1: '#(clientSecret1)'}
    * print data
    * print data.response.token


  @ignore
  Scenario: callable3
    * def clientId1 = 'SZPOckPrJx4B6HGE1hofP49xGxB'
    * def clientSecret1 = 'BXY7ccVfxRN+kdLRUTNYJYaDS98cZZFrDKu+KtQbBLoVSKQlyWWgR0hSGUL3xw6sSug5PxlI/ZVkwckWTn699A=='
    * def jsonObj =
      """
      {
        clientId: '#(clientId1)',
        clientSecret: '#(clientSecret1)'
      }
      """
    * def data = call read('callable3.feature') jsonObj
    * print data
    * print data.response.token

  @ignore
  Scenario: callable4
    * def jsonObj =
      """
      {
        clientId: 'SZPOckPrJx4B6HGE1hofP49xGxB',
        clientSecret: 'BXY7ccVfxRN+kdLRUTNYJYaDS98cZZFrDKu+KtQbBLoVSKQlyWWgR0hSGUL3xw6sSug5PxlI/ZVkwckWTn699A=='
      }
      """
    * def data = call read('callable4.feature') jsonObj
    * print data
    * print data.response.token

  @ignore
  Scenario: callable5
    * def jsonObj =
      """
      {
        clientId: 'SZPOckPrJx4B6HGE1hofP49xGxB',
        clientSecret: 'BXY7ccVfxRN+kdLRUTNYJYaDS98cZZFrDKu+KtQbBLoVSKQlyWWgR0hSGUL3xw6sSug5PxlI/ZVkwckWTn699A=='
      }
      """
    * def data = call read('callable5.feature') jsonObj
    * print data
    * print data.response.token

  @ignore
  Scenario: callable6
    * def jsonObj =
      """
      {
        clientId: 'SZPOckPrJx4B6HGE1hofP49xGxB',
        clientSecret: 'BXY7ccVfxRN+kdLRUTNYJYaDS98cZZFrDKu+KtQbBLoVSKQlyWWgR0hSGUL3xw6sSug5PxlI/ZVkwckWTn699A=='
      }
      """
    * def data = call read('callable6.feature@success') jsonObj
    * print data
    * print data.response.token

  Scenario: callable6
    * def jsonObj =
      """
      {
        clientId: 'SZPOckPrJx4B6HGE1hofP49xGxB',
        clientSecret: 'BXY7ccVfxRN+kdLRUTNYJYaDS98cZZFrDKu+KtQbBLoVSKQlyWWgR0hSGUL3xw6sSug5PxlI/ZVkwckWTn699A=='
      }
      """
    * def data = call read('callable6.feature@failure') jsonObj
    * print data
    * print data.response.token