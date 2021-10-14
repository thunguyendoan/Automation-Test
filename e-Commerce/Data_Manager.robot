*** Settings ***
Library    Custom_Libs/Read_csv.py

*** Keywords ***
Get CSV data
    [Arguments]    ${PATH}
    ${Data} =   read csv file   ${PATH}
    [Return]    ${Data}



