*** Settings ***
Library    SeleniumLibrary
Resource   ../../variables/TC-NEG-05-locators.robot

*** Keywords ***

Transfer Amount Greater Than Balance

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
    ...    1

    Input Text
    ...    ${AMOUNT_FIELD}
    ...    100000

    Sleep    2s

    Click Element
    ...    ${TRANSFER_BUTTON}

    Sleep    3s


Verify Insufficient Balance Validation

    Page Should Not Contain
    ...    Transfer Complete!