*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/Keyword_Login.robot

*** Keywords ***
Go to Forgot Page
    Go to Login page
    click element    xpath=//*[@id="login_form"]/div/p[1]/a

Input Forgot Password Email
    [Arguments]    ${Email}
    input text    id=email    ${Email}

Click Retrieve Password Button
    click element    xpath=//*[@id="form_forgotpassword"]/fieldset/p/button

Get Error Forgot Password
  ${Error} =  get text    xpath=//*[@id="center_column"]/div/div/ol/li
  [Return]    ${Error}

Verify Error forgot password with account not exist
    ${Error} =    Get Error Forgot Password
    should be equal as strings    ${Error}    There is no account registered for this email address.

Verify Error forgot password with invalid format email
    ${Error} =    Get Error Forgot Password
    should be equal as strings    ${Error}    Invalid email address.

Verify Error forgot password with Email is blank
    ${Error} =    Get Error Forgot Password
    should be equal as strings    ${Error}    Invalid email address.

Get Success Message
  ${Mgs} =  get text    xpath=//*[@id="center_column"]/div/p
  [Return]    ${Mgs}

Verify Forgot Success
    [Arguments]    ${Email}
    ${Msg} =    Get Success Message
    should be equal as strings    ${Msg}    A confirmation email has been sent to your address: ${Email}
