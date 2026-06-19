*** Settings ***
Documentation    TS-04 - Validate API Response Time
Resource        ../../resources/Pages/TC-API-06.robot

*** Test Cases ***
TC-API-06 - Validate API Response Time
    [Documentation]    Verify GET Accounts API response time is less than 2 seconds
    Validate API Response Time