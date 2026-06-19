*** Settings ***
Library     SeleniumLibrary

Resource    ../../variables/TC-TF-UI-04-locators.robot

*** Keywords ***

Transfer Funds Using Same Account

    Click Link    Transfer Funds

    Wait Until Element Is Visible
    ...    ${AMOUNT_FIELD}
    ...    10s

    Sleep    2s

    Select From List By Index
    ...    ${FROM_ACCOUNT_DROPDOWN}
    ...    0

    Select From List By Index
    ...    ${TO_ACCOUNT_DROPDOWN}
    ...    0

    Input Text
    ...    ${AMOUNT_FIELD}
    ...    100

    Sleep    2s

    Click Element
    ...    ${TRANSFER_BUTTON}

Verify Same Account Validation

    Page Should Not Contain
    ...    Transfer Complete!