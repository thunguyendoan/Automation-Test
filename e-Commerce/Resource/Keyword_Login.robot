*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Go to Login page
    click element    xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]

Input Email
    [Arguments]    ${Email}
    input text    id=email    ${Email}

Input Password
    [Arguments]    ${Password}
    input text    id=passwd    ${Password}

Click Submit Button
    click element    id=SubmitLogin

Login page
    [Arguments]    ${User}
    Go to Login page
    Input Email     ${User}[0]
    Input Password    ${User}[1]
    Click Submit Button
    Verify Error Message


Get Error
    wait until page contains element    xpath=//*[@id="center_column"]/div[1]/ol/li
    ${Error} =    get text    xpath=//*[@id="center_column"]/div[1]/ol/li
    [Return]    ${Error}

Verify Error Message
    ${Error} =  Get Error
    run keyword if    '${Error}' == 'An email address required.'     Verify Error Empty Email
    ...     ELSE IF   '${Error}' == 'Password is required.'          Verify Error Empty Password
    ...     ELSE IF   '${Error}' == 'An email address required.'     Verify Error Empty Email & Empty Password
    ...     ELSE IF   '${Error}' == 'Invalid password.'              Verify Error Account not exist
    ...     ELSE IF   '${Error}' == 'Authentication failed.'         Verify Error invalid email & valid password
    ...     ELSE IF   '${Error}' == 'Authentication failed.'         Verify Error valid email & invalid password
    ...     ELSE IF   '${Error}' == 'Invalid email address.'         Verify Error invalid format email


Verify Error Empty Email
    ${Error} =    Get Error
    should be equal as strings    ${Error}    An email address required.


Verify Error Empty Password
    ${Error} =    Get Error
    should be equal as strings    ${Error}    Password is required.

Verify Error Empty Email & Empty Password
    ${Error} =    Get Error
    should be equal as strings    ${Error}    An email address required.

Verify Error Account not exist
    ${Error} =    Get Error
    should be equal as strings    ${Error}    Invalid password.

Verify Error invalid email & valid password
    ${Error} =    Get Error
    should be equal as strings    ${Error}    Authentication failed.

Verify Error valid email & invalid password
    ${Error} =    Get Error
    should be equal as strings    ${Error}    Authentication failed.

Verify Error invalid format email
    ${Error} =    Get Error
    should be equal as strings    ${Error}    Invalid email address.

Get Name Login
    wait until page contains element    xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a
    ${Name} =    get text    xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a
    [Return]    ${Name}

Verify Login Successfully
    ${Name} =   Get Name Login
    should be equal as strings    ${Name}     thu nguyen

