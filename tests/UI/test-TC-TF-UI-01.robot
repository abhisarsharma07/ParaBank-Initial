*** Settings ***
Resource    ../../resources/common_resources.robot
Resource    ../../resources/Pages/TC-TF-UI-01.robot

Suite Setup       Launch Application
Suite Teardown    Close Application

*** Test Cases ***

TC-TF-UI-01 Successful Fund Transfer Between Two Accounts

    Ensure User Is Logged In

    Transfer Funds Between Accounts

    Page Should Contain
    ...    Transfer Complete!
