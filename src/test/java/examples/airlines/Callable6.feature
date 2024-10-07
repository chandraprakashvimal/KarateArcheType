Feature: reuse feature file

  @success
  Scenario: callable 5
    Given url 'https://api.sirv.com/v2/token'
    * print __arg
    When request __arg
    Then method post

  @failure
  Scenario: callable 5
    Given url 'https://api.sirv.com/v2/token1'
    * print __arg
    When request __arg
    Then method post
