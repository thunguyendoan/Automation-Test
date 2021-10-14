*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL} =    http://automationpractice.com/index.php
${BROWSER} =    chrome

*** Keywords ***
User Open Browser
    open browser    ${URL}    ${BROWSER}
    maximize browser window

User Close Browser
    close browser
