*** Settings ***
Library   SeleniumLibrary
Resource    ../Keywords/keywords.robot

*** Variables ***
${url_login}              http://the-internet.herokuapp.com/login
${page_title}             The Internet
${username_valid}         tomsmith
${password_valid}         SuperSecretPassword!
${invalid_password}       password
${invalid_username}       tomholland
${input_username}         id:username
${input_password}         id:password
${button_login}           class:radius
${button_logout}          //*[@id="content"]/div/a

*** Test Cases ***
Login Success
  Open Browser to Login
  Verify Login Page
  Add valid username
  Add valid password
  Click Login Button
  Verify Login Success
  Click Logout Button
  Verify Logout Success
  Close Browser

Login Failed - Password incorrect
  Open Browser to Login
  Verify Login Page
  Add valid username
  Add invalid password
  Click Login Button
  Verify Password invalid
  Close Browser

Login Failed - Username not found
  Open Browser to Login
  Verify Login Page
  Add invalid username
  Add invalid password
  Click Login Button
  Verify Username invalid
  Close Browser