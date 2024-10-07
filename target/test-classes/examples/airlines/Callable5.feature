Feature: reuse feature file


  Scenario: callable 5
    Given url 'https://api.sirv.com/v2/token'
    * print __arg
    When request __arg
    Then method post

  Scenario: callable 5
    Given url 'https://api.sirv.com/v2/token1'
    * print __arg
    When request __arg
    Then method post
