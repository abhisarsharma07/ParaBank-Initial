*** Settings ***
Library     RequestsLibrary
Library    Collections
Resource    ../../variables/TC-API-01-locators.robot

*** Keywords ***

Validate New Account Exists In API

    Create Session
    ...    ParaBank
    ...    ${BASE_URL}
    ...    verify=False

    ${headers}=    Create Dictionary
    ...    Accept=${ACCEPT_HEADER}

    ${response}=    GET On Session
    ...    ParaBank
    ...    /customers/${CUSTOMER_ID}/accounts
    ...    headers=${headers}

    Log To Console    Status Code : ${response.status_code}

    Should Be Equal As Integers
    ...    ${response.status_code}
    ...    ${EXPECTED_STATUS}

    ${response_body}=    Set Variable
    ...    ${response.text}

    Log To Console    Response : ${response_body}

    Should Contain
    ...    ${response_body}
    ...    ${NEW_ACCOUNT_ID}

    Log To Console
    ...    Account ID ${NEW_ACCOUNT_ID} found successfully in API response.