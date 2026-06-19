#Successful Fund Transfer Between Two Accounts
*** Settings ***
Library     SeleniumLibrary
Resource    ../../variables/TC-TF-UI-01-locators.robot

*** Keywords ***

Open Transfer Funds Page

    Click Link    Transfer Funds

    Wait Until Element Is Visible
    ...    ${AMOUNT_FIELD}
    ...    10s

    Sleep    2s

Transfer Funds Between Accounts

    Open Transfer Funds Page

    Input Text
    ...    ${AMOUNT_FIELD}
    ...    100

    Sleep    2s

    Select From List By Index
    ...    ${FROM_ACCOUNT_DROPDOWN}
    ...    0

    Sleep    1s

    Select From List By Index
    ...    ${TO_ACCOUNT_DROPDOWN}
    ...    1

    Sleep    2s

    Click Element
    ...    ${TRANSFER_BUTTON}

    Wait Until Page Contains
    ...    Transfer Complete!
    ...    10s
    
    Sleep    3s