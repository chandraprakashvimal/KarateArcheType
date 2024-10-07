Feature: jayway json path

  Scenario: jayway json path
    * def jsonObject = read('jsonFiles/bookStore.json')
    * print jsonObject.expensive
    * match jsonObject.expensive == 10
    * def e = get jsonObject.expensive
    * print "expensive value : ", e
    * def e1 = get jsonObject $.expensive
    * print e1
    * def e2 = $jsonObject.expensive
    * print e2
    * def e3 = karate.get('$jsonObject.expensive')
    * print e3
    * def e4 = karate.jsonPath(jsonObject, '$.expensive')
    * match e4 == e3
    * def e5 = jsonObject.store.book[1]
    * print e5
    * def e6 = karate.jsonPath(jsonObject, '$.store.book[*].title')
    * print e6
    * print (karate.jsonPath(jsonObject, '$.store.book[*].title'))[3]
    * def e7 = karate.jsonPath(jsonObject, '$..title')
    * print e7
    * def e7 = karate.jsonPath(jsonObject, '$..book..title')
    * print e7
    * def e7 = karate.jsonPath(jsonObject, '$.store.book[?(@.author == "J. R. R. Tolkien")].title')
    * print e7
    * def e7 = karate.jsonPath(jsonObject, '$.store.book[?(@.author == "J. R. R. Tolkien" || @.author == "Herman Melville")].title')
    * print e7
    * def e5 = karate.jsonPath(jsonObject, '$.store.book[-1]')
    * print e5
    * def e5 = karate.jsonPath(jsonObject, '$.store.book[1,2]')
    * print e5
    * def e5 = karate.jsonPath(jsonObject, '$.store.book[0:3]')
    * print e5
    * def e5 = karate.jsonPath(jsonObject, '$.store.book.length()')
    * print e5
#    * def e5 = karate.jsonPath(jsonObject, '$.store.book[*].price.sum()')
#    * print e5  bug
    * def e5 = karate.jsonPath(jsonObject, '$..price.sum()')
    * print e5
    * def e5 = karate.jsonPath(jsonObject, '$..price.max()')
    * print e5
    * def e5 = karate.jsonPath(jsonObject, '$..price.min()')
    * print e5
