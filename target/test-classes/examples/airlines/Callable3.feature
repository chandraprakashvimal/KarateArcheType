Feature: callable3


  Scenario: callable3
    Given url 'https://api.sirv.com/v2/token'
    When request
      """
      {
        "clientId": '#(clientId)',
        "clientSecret": '#(clientSecret)'
      }
      """
    Then method post
