*** Settings ***
Documentation    TS-04 - GET Accounts List via API
Resource         ../../resources/Pages/TC-API-00.robot
Resource         ../../variables/TC-API-00.robot

*** Test Cases ***
TC-API-00 - GET Accounts List via API
    [Documentation]    Verify complete accounts list is returned for a customer
    Get Accounts List By Customer Id