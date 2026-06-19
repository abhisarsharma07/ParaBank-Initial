TC-AC-UI-01: Create New Account With Valid Data
*** Settings ***
Library   SeleniumLibrary
Resource    ../../variables/TC-AC-UI-01-locators.robot

*** Keywords ***

Open New Account Page
    Click Link    Open New Account

Create New Account

    Open New Account Page

    Select From List By Label
    ...    ${ACCOUNT_TYPE_DROPDOWN}
    ...    SAVINGS

    Click Element
    ...    ${OPEN_ACCOUNT_BUTTON}

Capture Account ID

    Wait Until Page Contains
    ...    Account Opened!
    ...    15s

    Sleep    2s

    Wait Until Element Is Visible
    ...    ${NEW_ACCOUNT_ID}
    ...    15s

    ${account_id}=    Get Text
    ...    ${NEW_ACCOUNT_ID}

    Log To Console
    ...    New Account ID: ${account_id}

    RETURN    ${account_id}