*** Settings ***
Library    RequestsLibrary
Resource    ../../variables/TC-NEG-06-locators.robot
*** Keywords ***

Get Invalid Account Details

    Create Session
    ...    bank
    ...    https://parabank.parasoft.com

    ${headers}=    Create Dictionary
    ...    Accept=application/json

    ${response}=    GET On Session
    ...    bank
    ...    /parabank/services_proxy/bank/accounts/${INVALID_ACCOUNT}
    ...    headers=${headers}
    ...   expected_status=any

    RETURN    ${response}