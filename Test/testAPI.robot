*** Settings ***
Library   SeleniumLibrary
Library   RequestsLibrary
Library   Collections

*** Variables ***
${url_get}    https://reqres.in/api/

*** Test Cases ***
Test Get User Correct API
  Get User Correct API
  
Test Get User Incorrect API
  Get User Incorrect API

*** Keywords ***
Get User Correct API
  Create Session    GetUserAPI    ${url_get}
  ${res}=    Get On Session   GetUserAPI   users/12    expected_status=200
  Status Should Be    200   ${res}
  Log   ${res.json()}
  Should Be Equal As Integers    ${res.json()}[data][id]    12
  Should Be Equal As Strings    ${res.json()}[data][email]   rachel.howell@reqres.in
  Should Be Equal As Strings    ${res.json()}[data][first_name]    Rachel   
  Should Be Equal As Strings    ${res.json()}[data][last_name]   Howell
  Should Be Equal As Strings    ${res.json()}[data][avatar]   https://reqres.in/img/faces/12-image.jpg
  
Get User Incorrect API
  Create Session    GetUserAPI    ${url_get}
  ${res}=   Get On Session  GetUserAPI   user/1234   expected_status=404
  Status Should Be    404   ${res}
  Log   ${res.json()}
  Should Be Empty   ${res.json()}
