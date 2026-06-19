*** Settings ***
Library     SeleniumLibrary
Resource    ../../variables/TC-AC-UI-03-locators.robot
*** Keywords ***
Create New Account Without Selecting Account Type

    Click Link    Open New Account

    Wait Until Element Is Visible
    ...    ${ACCOUNT_TYPE_DROPDOWN}
    ...    10s

    Sleep    2s

    Select From List By Label
    ...    ${ACCOUNT_TYPE_DROPDOWN}
    ...    Select One

    Sleep    2s

    Click Element
    ...    ${OPEN_ACCOUNT_BUTTON}

Verify Account Type Validation Message

    Wait Until Page Contains
    ...    Please select account type
    ...    10s

    Page Should Contain
    ...    Please select account type


