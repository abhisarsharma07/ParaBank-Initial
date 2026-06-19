*** Settings ***
Library     RequestsLibrary
Library     Collections

Resource    ../../variables/TC-API-02-locators.robot

*** Keywords ***

Validate API Response Status And Structure

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

    ${response_json}=    Set Variable
    ...    ${response.json()}

    Log To Console    Response JSON : ${response_json}

    Should Not Be Empty
    ...    ${response_json}

    ${first_account}=    Set Variable
    ...    ${response_json}[0]

    Dictionary Should Contain Key
    ...    ${first_account}
    ...    id

    Dictionary Should Contain Key
    ...    ${first_account}
    ...    type

    Dictionary Should Contain Key
    ...    ${first_account}
    ...    balance

    Log To Console    id field is present
    Log To Console    type field is present
    Log To Console    balance field is present