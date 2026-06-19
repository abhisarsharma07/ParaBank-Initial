*** Settings ***
Library     RequestsLibrary
Library     Collections

Resource    ../../variables/TC-API-04-locators.robot

*** Keywords ***

Validate Account Balance Details Via API

    Create Session
    ...    ParaBank
    ...    ${BASE_URL}
    ...    verify=False

    ${headers}=    Create Dictionary
    ...    Accept=${ACCEPT_HEADER}

    ${response}=    GET On Session
    ...    ParaBank
    ...    /accounts/${ACCOUNT_ID}
    ...    headers=${headers}

    Log To Console    Status Code : ${response.status_code}

    Should Be Equal As Integers
    ...    ${response.status_code}
    ...    ${EXPECTED_STATUS}

    ${response_json}=    Set Variable
    ...    ${response.json()}

    Log To Console    Response : ${response_json}

    Dictionary Should Contain Key
    ...    ${response_json}
    ...    balance

    ${api_balance}=    Set Variable
    ...    ${response_json['balance']}

    Log To Console    Expected Balance : ${INITIAL_DEPOSIT}
    Log To Console    API Balance : ${api_balance}

    Should Be Equal As Numbers
    ...    ${api_balance}
    ...    ${INITIAL_DEPOSIT}

    Log To Console    Balance validation successful.