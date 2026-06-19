*** Settings ***
Library     RequestsLibrary
Library     Collections

Resource    ../../variables/TC-API-03-locators.robot

*** Keywords ***

Validate Account Type Matches UI Input

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
    ...    type

    ${api_account_type}=    Set Variable
    ...    ${response_json['type']}

    Log To Console    UI Account Type : ${UI_ACCOUNT_TYPE}
    Log To Console    API Account Type : ${api_account_type}

    Should Be Equal
    ...    ${api_account_type}
    ...    ${UI_ACCOUNT_TYPE}

    Log To Console    Account type validation successful.