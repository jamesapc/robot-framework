*** Keywords ***
Click Login Button
  Click Button    ${button_login}

Click Logout Button
  Click Element    ${button_logout}

Open Browser to Login
  Open Browser    ${url_login}    chrome

Add valid username
  Input Text    ${input_username}   ${username_valid}

Add valid password
  Input Password    ${input_password}  ${password_valid}

Add invalid username
  Input Text    ${input_username}   ${invalid_username}

Add invalid password
  Input Password    ${input_password}   ${invalid_username}

Verify Login Page
  Title Should Be   ${page_title}

Verify Login Success
  Page Should Contain   You logged into a secure area!

Verify Logout Success
  Page Should Contain   You logged out of the secure area!

Verify Password invalid
  Page Should Contain   Your password is invalid!

Verify Username invalid
  Page Should Contain   Your username is invalid!