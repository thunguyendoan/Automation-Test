*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Go to Contact Page
    click element    id=contact-link

Input Email Contact
    [Arguments]    ${Email}
    input text    id=email    ${Email}

Choose Subject
    [Arguments]    ${Value}
    select from list by value    id=id_contact    ${Value}

Upload file
    wait until element is enabled    fileUpload
    choose file    fileUpload    C:/Users/DELL/Downloads/TE-Scrypt Education-TestPlan.docx

Input Message
    [Arguments]    ${Content}
    input text    id=message    ${Content}

Click Send Button
    click element    id=submitMessage

Get Error
    wait until page contains element    xpath=//*[@id="center_column"]/div/ol/li
    ${Error} =    get text    xpath=//*[@id="center_column"]/div/ol/li
    [Return]    ${Error}

Verify Error for Email
    ${Error} =  Get Error
    should be equal as strings    ${Error}    Invalid email address.

Verify Error for Subject Heading
    ${Error} =    Get Error
    should be equal as strings    ${Error}    Please select a subject from the list provided.

Verify Error for Message is Blank
    ${Error} =    Get Error
    should be equal as strings    ${Error}    The message cannot be blank.

Get Success Message
    wait until page contains element    xpath=//*[@id="center_column"]/p
    ${Message} =    get text    xpath=//*[@id="center_column"]/p
    [Return]    ${Message}

Verify Success Message
    ${Message} =  Get Success Message
    should be equal as strings    ${Message}    Your message has been successfully sent to our team.

