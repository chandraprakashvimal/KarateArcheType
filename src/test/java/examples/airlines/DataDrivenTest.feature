Feature: Data driven test

  @ignore
  Scenario Outline: Data set up for <name>
    * def id = <id>
    * def name = "<name>"
    * def isAlive = <isAlive>
    * print "Data is: ", id, name, isAlive
    * match id == '#number'
    * match name == '#string'
    * match isAlive == '#boolean'
    * print __row
    * print __num
    Examples:
      | id! | name    | isAlive! |
      | 1   | cp      | false    |
      | 2   | vishwas | true     |

  @ignore
  Scenario Outline: Auto variables
    * def jsonDoc =
      """
      {
        "id": <id>,
        "name": "<name>",
        "isAlive": <isAlive>
      }
      """
    * match id == '#number'
    * match name == '#string'
    * match isAlive == '#boolean'
    * print __row
    * print __num
    Examples:
      | id! | name    | isAlive! |
      | 1   | cp      | false    |
      | 2   | vishwas | true     |

  @ignore
  Scenario Outline: ebmedded exp
    * def jsonDoc =
      """
      {
    "id": #(id),
    "name": "#(name)",
    "isAlive": #(isAlive)
    }
    """
    * print jsonDoc
    Examples:
      | id! | name    | isAlive! |
      | 1   | cp      | false    |
      | 2   | vishwas | true     |

  @ignore
  Scenario Outline: ebmedded exp for null
    * def jsonDoc =
      """
      {
    "id": ##(id),
    "name": "##(name)",
    "isAlive": #(isAlive)
    }
    """
    * print jsonDoc
    Examples:
      | id! | name | isAlive! |
      | 1   | cp   | false    |
      | 2   |      | true     |

  @ignore
  Scenario Outline: ebmedded exp for variables
    * def randomName = "chandra"
    * def jsonDoc =
      """
      {
    "id": #(id),
    "name": "<name>",
    "isAlive": #(isAlive)
    }
    """
    * print jsonDoc
    Examples:
      | id! | name          | isAlive! |
      | 1   | cp            | false    |
      | 2   | #(randomName) | true     |

  @ignore
  Scenario Outline: json file
    * def jsonDoc =
      """
      {
        "id": <id>,
        "name": "<name>",
        "isManager": <isManager>
      }
      """
    * print jsonDoc
    Examples:
      | read('/jsonFiles/MOCK_DATA.json') |

  @ignore
  Scenario Outline: json file with embedded var
    * def jsonDoc =
      """
      {
    "id": ##(id),
    "name": "##(name)",
    "isManager": ##(isManager)
    }
    """
    * print jsonDoc
    * print __row
    Examples:
      | read('/jsonFiles/MOCK_DATA.json') |

      @ignore
  Scenario Outline: external utility to remove null from map
    * print __row
    * def utils = Java.type('examples.airlines.utils.jsonUtils')
    * def jsonObj = utils.removeNullValues(__row)
    * print jsonObj
    * print __row
    Examples:
      | read('/jsonFiles/MOCK_DATA.json') |

      @ignore
  Scenario Outline: external utility to remove null from string
    * print __row
    * def utils = Java.type('examples.airlines.utils.jsonUtils')
#    * def jsonObj = utils.removeNullValues(__row)
    * def jsonObj = utils.removeNullValues(karate.toString(__row))
    * print jsonObj
    * print __row
    Examples:
      | read('/jsonFiles/MOCK_DATA.json') |

  Scenario Outline: external utility to remove null from string(csv)
    * print __row
    * def utils = Java.type('examples.airlines.utils.jsonUtils')
    #    * def jsonObj = utils.removeNullValues(__row)
    * def jsonObj = utils.removeNullValues(karate.toString(__row))
    * print jsonObj
    * print __row
    Examples:
      | read('/jsonFiles/MOCK_DATA.csv') |