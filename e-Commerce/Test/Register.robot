*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/Common_Keyword.robot
Resource    ../Resource/Keyword_Register.robot
Resource    ../Resource/Keyword_Login.robot
#Library     Collections

Test Setup    User Open Browser
Test Teardown    User Close Browser

*** Variables ***
${USER1} =    thu@mailinator.com
${USER2} =    thugmail.com
${USER3} =    thuthuthu@mailinator.com


*** Test Cases ***
Register Unssucessfully with Email already register
    [Tags]    Smoke
    Go to Login page
    Input Email Register    ${USER1}
    Click Create an account Button
    Verify Error Register with Email exist

Register Unssucessfully with Email is Blank
    Go to Login page
    Click Create an account Button
    Verify Error Register with Email is Blank

Register Unssucessfully with invalid format Email
    Go to Login page
    Input Email Register    ${USER2}
    Click Create an account Button
    Verify Error Register with invalid format Email

Verify Register Unsuccessfully with First Name is Blank
    Go to Register Page    ${USER3}
    Checkbox Gender    1
    Input LastName Register    nguyen
    Input Password Register    12345
    Dropdown Day Month Year    31    3    1997
    select checkbox    newsletter
    Input Address    thu    ABC    123 abc    ho chi minh    2    00000    21    0389652449    abc
    Click Register Button
    Verify Error Message First Name

Verify Register Unsuccessfully with Last Name is Blank
    Go to Register Page    ${USER3}
    Checkbox Gender    1
    Input FirstName Register    thu
    Input Password Register    12345
    Dropdown Day Month Year    31    3    1997
    select checkbox    newsletter
    Input Address    thu    ABC    123 abc    ho chi minh    2    00000    21    0389652449    abc
    Click Register Button
    Verify Error Message Last Name

Verify Register Unsuccessfully with Password is Blank
    Go to Register Page    ${USER3}
    Checkbox Gender    1
    Input FirstName Register    thu
    Input LastName Register    nguyen
    Dropdown Day Month Year    31    3    1997
    select checkbox    newsletter
    Input Address    thu    ABC    123 abc    ho chi minh    2    00000    21    0389652449    abc
    Click Register Button
    Verify Error Message Password

Verify Register Unsuccessfully with Password is invalid
    Go to Register Page    ${USER3}
    Checkbox Gender    1
    Input FirstName Register    thu
    Input LastName Register    nguyen
    Input Password    123
    Dropdown Day Month Year    31    3    1997
    select checkbox    newsletter
    Input Address    thu    ABC    123 abc    ho chi minh    2    00000    21    0389652449    abc
    Click Register Button
    Verify Error Message Invalid Password

Verify Register Successfully with Password is invalid
    [Tags]    Smoke
    Go to Register Page    ${USER3}
    Checkbox Gender    1
    Input FirstName Register    thu
    Input LastName Register    nguyen
    Input Password    12345
    Dropdown Day Month Year    31    3    1997
    select checkbox    newsletter
    Input Address    thu    ABC    123 abc    ho chi minh    2    00000    21    0389652449    abc
    Click Register Button
    Verify Register Successfully


