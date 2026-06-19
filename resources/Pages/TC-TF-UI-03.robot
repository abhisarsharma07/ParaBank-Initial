*** Settings ***
Library     SeleniumLibrary
Library     Collections

Resource    ../../variables/TC-TF-UI-03-locators.robot

*** Keywords ***

Get Accounts From Overview

    Click Link    Accounts Overview

    Wait Until Page Contains
    ...    Accounts Overview
    ...    10s

    Sleep    2s

    ${accounts}=    Get WebElements
    ...    xpath=//table[@id='accountTable']//a

    ${account_list}=    Create List

    FOR    ${acc}    IN    @{accounts}

        ${account_no}=    Get Text    ${acc}

        Append To List
        ...    ${account_list}
        ...    ${account_no}

    END

    RETURN    ${account_list}

Open Transfer Funds Page

    Click Link    Transfer Funds

    Wait Until Element Is Visible
    ...    ${FROM_ACCOUNT_DROPDOWN}
    ...    10s

    Sleep    2s

Verify Accounts Present In Transfer Dropdowns

    [Arguments]    ${account_list}

    ${from_accounts}=    Get List Items
    ...    ${FROM_ACCOUNT_DROPDOWN}

    ${to_accounts}=    Get List Items
    ...    ${TO_ACCOUNT_DROPDOWN}

    FOR    ${account}    IN    @{account_list}

        List Should Contain Value
        ...    ${from_accounts}
        ...    ${account}

        List Should Contain Value
        ...    ${to_accounts}
        ...    ${account}

    END
    Log To Console
    ...    Accounts Overview: ${account_list}

    Log To Console
    ...    From Dropdown: ${from_accounts}

    Log To Console
    ...    To Dropdown: ${to_accounts}