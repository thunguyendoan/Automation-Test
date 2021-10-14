*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/Common_Keyword.robot
Resource    ../Resource/Keyword_Login.robot
Resource    ../Data_Manager.robot

Test Setup    User Open Browser
Test Teardown    User Close Browser

*** Variables ***
${User} =        thu1@mailinator.com
${Password} =    12345

*** Test Cases ***
Login Unsuccessfully scenarios
    @{Users} =    Get CSV data    ../Data/Username_data.csv
    FOR  ${User}    IN    @{Users}
        Login page    ${User}
    END

Login Successfully scenarios
    Go to Login page
    Input Email    ${User}
    Input Password    ${Password}
    Click Submit Button
    Verify Login Successfully


#Login with empty email
#    Go to Login page
#    Input Password    123
#    click element    id=SubmitLogin
#    Verify Error Empty Email

#Login with empty password
#    [Arguments]    ${User}
#    Go to Login page
#    Input Email    ${User}[0]
#    click element    id=SubmitLogin
#    Verify Error Empty Password

#Login with empty email & password
#    Go to Login page
#    click element    id=SubmitLogin
#    Verify Error Empty Email & Empty Password
#
#Login with account not exist
#    Go to Login page
#    Input Email    thu1@mailinator.com
#    Input Password    123
#    click element    id=SubmitLogin
#    Verify Error Account not exist
#
#Login with invalid email & valid password
#    Go to Login page
#    Input Email    thu1@mailinator.com
#    Input Password    12345
#    click element    id=SubmitLogin
#    Verify Error invalid email & valid password
#
#Login with valid email & invalid password
#    Go to Login page
#    Input Email    thu@mailinator.com
#    Input Password    12367
#    click element    id=SubmitLogin
#    Verify Error valid email & invalid password
#
#Login with invalid format email
#    Go to Login page
#    Input Email    thugmail.com
#    click element    id=SubmitLogin
#    Verify Error invalid format email

