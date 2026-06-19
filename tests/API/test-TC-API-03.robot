*** Settings ***
Documentation    TS-05 - Validate Account Type Matches UI Input
Resource     ../../resources/Pages/TC-API-03.robot

*** Test Cases ***
TC-API-03 - Validate Account Type Matches UI Input
    [Documentation]    Verify API account type matches UI selected account type
    Validate Account Type Matches UI Input