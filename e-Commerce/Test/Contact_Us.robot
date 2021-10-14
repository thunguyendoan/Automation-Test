*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/Common_Keyword.robot
Resource    ../Resource/Keyword_Contact_Us.robot

Test Setup    User Open Browser
Test Teardown    User Close Browser

*** Variables ***
${USER1} =    thu@mailinator.com
${USER2} =    thumailinator.com

*** Test Cases ***
Verify Send Contact Successfully
    [Tags]    Smoke
    Go to Contact Page
    Input Email Contact    ${USER1}
    Choose Subject    2
    Upload file
    Input Message    abcd
    Click Send Button
    Verify Success Message

Verify Send Contact Unsuccessfully with Email is Blank
    [Tags]    Smoke
    Go to Contact Page
    Choose Subject    1
    Upload file
    Input Message    abcde
    Click Send Button
    Verify Error for Email

Verify Send Contact Unsuccessfully with Invalid format Email
    Go to contact page
    Input Email Contact     ${USER2}
    Choose Subject    1
    Upload file
    Input Message    thu test
    Click Send Button
    Verify Error for Email

Verify Send Contact Unsuccessfully with Subject Heading is Blank
    Go to Contact Page
    Input Email Contact    ${USER1}
    Upload file
    Input Message    thu dang test
    Click Send Button
    Verify Error for Subject Heading

Verify Send Contact Unsuccessfully with Message is Blank
    Go to Contact Page
    Input Email Contact    ${USER1}
    Choose Subject    2
    Upload file
    Click Send Button
    Verify Error for Message is Blank



