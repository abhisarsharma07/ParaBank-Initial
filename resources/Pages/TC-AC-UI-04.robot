#Verify New Account Appears in Account Overview
*** Settings ***
Library   SeleniumLibrary
Resource    ../../variables/TC-AC-UI-04-locators.robot
*** Keywords ***

Open New Account Page
    Click Link    Open New Account

    Wait Until Element Is Visible
    ...    ${ACCOUNT_TYPE_DROPDOWN}
    ...    10s

Create New Account

    Open New Account Page

    Sleep    2s

    Select From List By Label
    ...    ${ACCOUNT_TYPE_DROPDOWN}
    ...    SAVINGS

    Sleep    2s

    Click Element
    ...    ${OPEN_ACCOUNT_BUTTON}

Capture Account ID

    Wait Until Element Is Visible
    ...    ${NEW_ACCOUNT_ID}
    ...    10s

    Sleep    2s

    ${account_id}=    Get Text
    ...    ${NEW_ACCOUNT_ID}

    RETURN    ${account_id}

Open Account Overview

    Click Link    Accounts Overview

    Wait Until Page Contains
    ...    Accounts Overview
    ...    10s

Verify Account Present In Overview

    [Arguments]    ${account_id}

    Page Should Contain
    ...    ${account_id}