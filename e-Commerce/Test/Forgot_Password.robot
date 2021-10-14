*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/Common_Keyword.robot
Resource    ../Resource/Keyword_Forgot_Password.robot

Test Setup    User Open Browser
Test Teardown    User Close Browser

*** Variables ***
${USER1} =    thuthuthu@gmail.com
${USER2} =    thuthuthugmail.com
${USER3} =    thu@mailinator.com


*** Test Cases ***
Forgot Password Unsuccessfully with account not exist
    [Tags]    Smoke
    Go to Forgot Page
    Input Forgot Password Email    ${USER1}
    Click Retrieve Password Button
    Verify Error forgot password with account not exist

Forgot Password Unsuccessfully with invalid format email
    Go to Forgot Page
    Input Forgot Password Email    ${USER2}
    Click Retrieve Password Button
    Verify Error forgot password with invalid format email

Forgot Password Unsuccessfully with Email is Blank
    Go to Forgot Page
    Click Retrieve Password Button
    Verify Error forgot password with Email is blank

Forgot Password Successfully with exist Email
    [Tags]    Smoke
    Go to Forgot Page
    input forgot password email    ${USER3}
    Click Retrieve Password Button
    Verify Forgot Success    ${USER3}


