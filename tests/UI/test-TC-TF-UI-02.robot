*** Settings ***
Resource    ../../resources/common_resources.robot
Resource    ../../resources/Pages/TC-TF-UI-02.robot

Suite Setup       Launch Application
Suite Teardown    Close Application



*** Test Cases ***

TC-TF-UI-02 Verify Confirmation Message Details After Transfer

    Ensure User Is Logged In

    ${from_account}    ${to_account}    ${amount}=    Transfer Funds Between Accounts

    Verify Transfer Confirmation Details
    ...    ${from_account}
    ...    ${to_account}
    ...    ${amount}