*** Settings ***
Resource    ../../resources/common_resources.robot
Resource    ../../resources/Pages/TC-E2E-02.robot

Test Setup       Launch Application
Test Teardown    Close Application

*** Test Cases ***

TC-E2E-02 Transfer Funds Via UI And Validate Via API

    Ensure User Is Logged In

    ${amount}=    Set Variable    50

    ${from_account}    ${to_account}    ${before_from}    ${before_to}=    Perform Transfer
    ...    ${amount}

    Log To Console
    ...    From Account: ${from_account}

    Log To Console
    ...    To Account: ${to_account}

    Log To Console
    ...    Before From Balance: ${before_from}

    Log To Console
    ...    Before To Balance: ${before_to}

    Validate Balance Changes
    ...    ${from_account}
    ...    ${to_account}
    ...    ${amount}
    ...    ${before_from}
    ...    ${before_to}