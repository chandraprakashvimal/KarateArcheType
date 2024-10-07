Feature: file upload

  @ignore
  Scenario: Binary file upload
    Given url 'https://api.sirv.com/v2/files/upload'
    When param filename = '/myphoto.jpeg'
    When header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRJZCI6IlNaUE9ja1BySng0QjZIR0UxaG9mUDQ5eEd4QiIsImNsaWVudE5hbWUiOiJjaGFuZHJhcHJha2FzaCIsInNjb3BlIjpbImFjY291bnQ6cmVhZCIsImFjY291bnQ6d3JpdGUiLCJ1c2VyOnJlYWQiLCJ1c2VyOndyaXRlIiwiYmlsbGluZzpyZWFkIiwiYmlsbGluZzp3cml0ZSIsImZpbGVzOnJlYWQiLCJmaWxlczp3cml0ZSIsImZpbGVzOmNyZWF0ZSIsImZpbGVzOnVwbG9hZDptdWx0aXBhcnQiLCJmaWxlczpzaGFyZWRCaWxsaW5nIiwidmlkZW9zIiwiaW1hZ2VzIl0sImlhdCI6MTcyNTUxNzExOCwiZXhwIjoxNzI1NTE4MzE4LCJhdWQiOiJpcmdmdndoa21tdnJyaWRlYzA1a3Z6bnhtdGJyZnVxaSJ9.cPwiBc26sn4tLV3KRc57TnbVp21VnYCpzfGVt8BNLhE'
    Then request read('jsonFiles/DSC_0221.JPG')
    When header Content-Type = 'image/png'
    Then method post
    Then status 200

  Scenario: Multipart file upload
    Given url 'https://upload.uploadcare.com/base/'
    When multipart file logoFile = {read: 'jsonFiles/DSC_0221.JPG', filename: 'karate.JPG'}
    When multipart field UPLOADCARE_PUB_KEY = '79e7460fd59a8d8cbec3'
    Then method post
    Then status 200