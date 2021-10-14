*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/Keyword_Login.robot


*** Keywords ***
Input Email Register
    [Arguments]    ${Email}
    input text    id=email_create    ${Email}

Click Create an account Button
    click element    id=SubmitCreate

Go to Register Page
    [Arguments]    ${Email}
    Go to Login page
    Input Email Register    ${Email}
    Click Create an account Button

Checkbox Gender
    [Arguments]    ${Gender}
    wait until page contains element    id_gender
    select radio button    id_gender    ${Gender}

Input FirstName Register
    [Arguments]    ${FirstName}
    input text    id=customer_firstname    ${FirstName}

Input LastName Register
    [Arguments]    ${LastName}
    input text    id=customer_lastname    ${LastName}

Input Password Register
    [Arguments]   ${Pass}
    input text    id=passwd    ${Pass}

Dropdown Day Month Year
    [Arguments]    ${Day}    ${Month}    ${Year}
    wait until page contains element    id=days
#    @{All_Item} =    get list items    id=days
    select from list by value    id=days    ${Day}
    select from list by value    id=months    ${Month}
    select from list by value    id=years    ${Year}

Input Address
    [Arguments]    ${FirstName}    ${Company}    ${Address}    ${City}    ${State}    ${Post}    ${country}    ${Phone}    ${alias}
    input text    id=firstname    ${FirstName}
    input text    id=company    ${Company}
    input text    id=address1    ${Address}
    input text    id=city    ${City}
    select from list by value    id_state    ${State}
    input text    id=postcode    ${Post}
    select from list by value    id_country    ${country}
    input text    id=phone_mobile    ${Phone}
    input text    id=alias    ${alias}

Click Register Button
    click element    id=submitAccount

Get Error Register
    wait until page contains element    xpath=//*[@id="create_account_error"]/ol/li
    ${Error} =    get text    xpath=//*[@id="create_account_error"]/ol/li
    [Return]    ${Error}

Verify Error Register with Email exist
    ${Error} =    Get Error Register
    should be equal as strings    ${Error}    An account using this email address has already been registered. Please enter a valid password or request a new one.

Verify Error Register with Email is Blank
    ${Error} =    Get Error Register
    should be equal as strings    ${Error}    Invalid email address.

Verify Error Register with invalid format Email
    ${Error} =    Get Error Register
    should be equal as strings    ${Error}    Invalid email address.

Get Error Message in Create An Account page
    wait until page contains element  xpath=//*[@id="center_column"]/div/ol/li
    ${Error} =  get text    xpath=//*[@id="center_column"]/div/ol/li
    [Return]    ${Error}

Verify Error Message First Name
   ${Error} =  Get Error Message in Create An Account page
   should be equal as strings    ${Error}    firstname is required.

Verify Error Message Last Name
   ${Error} =  Get Error Message in Create An Account page
   should be equal as strings    ${Error}    lastname is required.

Verify Error Message Password
   ${Error} =  Get Error Message in Create An Account page
   should be equal as strings    ${Error}    passwd is required.

Verify Error Message Invalid Password
   ${Error} =  Get Error Message in Create An Account page
   should be equal as strings    ${Error}    passwd is invalid.

Get Name Register
    wait until page contains element    xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a
    ${Name} =    get text    xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a
    [Return]    ${Name}

Verify Register Successfully
    ${Name} =   Get Name Login
    should be equal as strings    ${Name}     thu nguyen


