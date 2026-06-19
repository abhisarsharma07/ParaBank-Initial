*** Settings ***
Documentation    TS-05 - Validate Account Balance Details via API
Resource    ../../resources/Pages/TC-API-04.robot

*** Test Cases ***
TC-API-04 - Validate Account Balance Details via API
    [Documentation]    Verify account balance matches initial deposit amount
    Validate Account Balance Details Via API