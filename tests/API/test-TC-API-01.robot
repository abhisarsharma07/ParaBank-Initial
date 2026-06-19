*** Settings ***
Documentation    TS-04 - Validate New Account Exists via API
Resource    ../../resources/Pages/TC-API-01.robot

*** Test Cases ***
TC-API-01 - Validate New Account Exists via API
    [Documentation]    Verify account created via UI is present in API response
    Validate New Account Exists In API