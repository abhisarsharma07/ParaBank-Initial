*** Settings ***
Library     SeleniumLibrary

Resource    ../../variables/TC-NEG-03-locators.robot

*** Keywords ***

Transfer Negative Amount

    Click Link    Transfer Funds

    Wait Until Element Is Visible
    ...    ${AMOUNT_FIELD}
    ...    10s

    Sleep    2s

    Input Text
    ...    ${AMOUNT_FIELD}
    ...    -50

    Select From List By Index
    ...    ${FROM_ACCOUNT_DROPDOWN}
    ...    0

    Select From List By Index
    ...    ${TO_ACCOUNT_DROPDOWN}
    ...    1

    Sleep    2s

    Click Element
    ...    ${TRANSFER_BUTTON}