*** Settings ***
Resource    ../../resources/common_resources.robot

Suite Setup       Launch Application
Suite Teardown    Close Application

*** Test Cases ***

Verify User Registration And Login

    Ensure User Is Logged In

    Wait Until Page Contains
    ...    Accounts Overview
    ...    10s