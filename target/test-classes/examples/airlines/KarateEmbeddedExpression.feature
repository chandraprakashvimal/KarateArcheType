Feature: embeded expression

  @ignore
  Scenario: embeded expression
    * def employee = {fname: 'chandra', lname : 'prakash'}
    * print employee
    * def fname = 'chandra'
    * def lname = 'prakash'
    * def idVal = 100
    * def isManager = false
    * def employee1 = {fname : '#(fname)', lname : '#(lname)', id : '#(idVal)', isManager: '#(isManager)'}
    * print employee1
    * def employee2 = {fullName : '#("Hello " + fname + " " + lname)'}
    * print employee2
    * def payload = read("jsonFiles/employee.json")
    * print payload

  Scenario: embeded expression2
    * def employee = {fname: 'chandra', lname : 'prakash'}
    * print employee
    * def fname = 'chandra'
    * def lname = 'prakash'
    * def idVal = null
    * def isManager = false
    * def employee1 = {fname : '#(employee.fname)', lname : '#(employee.lname)', id : '##(idVal)', isManager: '#(isManager)'}
    * print employee1