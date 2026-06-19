*** Settings ***
Library    SeleniumLibrary

Resource    Pages/login.robot
Resource    Pages/register.robot

*** Variables ***
${BASE_URL}    https://parabank.parasoft.com/parabank/index.htm
${BROWSER}     chrome

*** Keywords ***

Launch Application
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

Close Application
    Close Browser

Ensure User Is Logged In
    Login User

    ${login_success}=    Run Keyword And Return Status
    ...    Wait Until Page Contains
    ...    Accounts Overview
    ...    10s

    IF    not ${login_success}
        Go To    ${BASE_URL}
        Register User
    END