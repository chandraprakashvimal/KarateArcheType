Feature: Create payload

  @ignore
  Scenario: json object
    * set requestPayload
      | path                 | value     |
      | id                   | 12        |
      | name                 | 'chandra' |
      | address[0].primary   | "lko"     |
      | address[0].id        | 1         |
      | address[1].secondary | "blr"     |
      | address[1].id        | 2         |
      | location.primary     | "india"   |
      | location.id          | 1         |
      | location.secondary   | "US"      |
    Then print requestPayload

  Scenario: json array
    * set requestPayload
      | path | 0         | 1    |
      | id   | 12        | 1    |
      | name | 'chandra' | 'qw' |

    Then print requestPayload
