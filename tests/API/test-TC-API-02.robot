*** Settings ***
Documentation    TS-04 - Validate API Response Status and Structure
Resource        ../../resources/Pages/TC-API-02.robot

*** Test Cases ***
TC-API-02 - Validate API Response Status and Structure
    [Documentation]    Verify response status and schema fields
    Validate API Response Status And Structure