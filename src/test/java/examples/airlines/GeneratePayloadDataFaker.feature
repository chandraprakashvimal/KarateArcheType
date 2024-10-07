Feature: Generate data

  @ignore
  Scenario: generate data using data faker
    * def dataFaker = Java.type("net.datafaker.Faker")
    * def dataFakerObj = new dataFaker()
    * def idValue = dataFakerObj.number().digits(5)
    * def nameValue = dataFakerObj.name().fullName()
    * set jsonObj
      | path     | value                      |
      | id       | idValue                    |
      | name     | nameValue                  |
      | fullName | dataFakerObj.name().name() |
    * print jsonObj

  Scenario: generate data using custom data faker class
    * def faker = Java.type("examples.airlines.javaDataFaker.RandomDataGenerator")
    * def idValue = faker.getRandomNumber(5)
    * def nameValue = faker.getRandomName()
    * set jsonObj
      | path | value     |
      | id   | idValue   |
      | name | nameValue |
    * print jsonObj