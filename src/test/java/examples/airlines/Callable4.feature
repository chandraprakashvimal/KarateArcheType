Feature: callable 4


  Scenario: callable 4
    Given url 'https://api.sirv.com/v2/token'
    * print __arg
    When request __arg
    Then method post
