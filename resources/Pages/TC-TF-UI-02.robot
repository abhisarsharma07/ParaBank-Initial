#Verify Confirmation Message Details After Transfer
*** Settings ***
Library     SeleniumLibrary
Resource    ../../variables/TC-TF-UI-02-locators.robot

*** Keywords ***
*** Keywords ***


Open Transfer Funds Page

    Click Link    Transfer Funds

    Wait Until Element Is Visible
    ...    ${AMOUNT_FIELD}
    ...    10s

    Sleep    2s
Transfer Funds Between Accounts

    Open Transfer Funds Page

    ${amount}=    Set Variable    100

     ${from_account}=    Get Selected List Label
    ...    ${FROM_ACCOUNT_DROPDOWN}

    ${to_account}=    Get Selected List Label
    ...    ${TO_ACCOUNT_DROPDOWN}

    Input Text
    ...    ${AMOUNT_FIELD}
    ...    ${amount}

    Sleep    2s

    Select From List By Index
    ...    ${FROM_ACCOUNT_DROPDOWN}
    ...    0

    Select From List By Index
    ...    ${TO_ACCOUNT_DROPDOWN}
    ...    1

    Sleep    2s

    Click Element
    ...    ${TRANSFER_BUTTON}

    Wait Until Page Contains
    ...    Transfer Complete!
    ...    10s

    RETURN    ${from_account}    ${to_account}    ${amount}



Verify Transfer Confirmation Details

    [Arguments]
    ...    ${from_account}
    ...    ${to_account}
    ...    ${amount}

    Wait Until Page Contains
    ...    Transfer Complete!
    ...    10s

    Sleep    2s

    Log To Console
    ...    From Account: ${from_account}

    Log To Console
    ...    To Account: ${to_account}

    Log To Console
    ...    Amount: ${amount}

    Page Should Contain
    ...    ${from_account}

    Page Should Contain
    ...    ${to_account}

    Page Should Contain
    ...    ${amount}