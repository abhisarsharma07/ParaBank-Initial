*** Settings ***
Library     RequestsLibrary
Library     Collections

Resource    ../../variables/TC-API-06-locators.robot

*** Keywords ***

Validate API Response Time

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

    ${response_time}=    Set Variable
    ...    ${response.elapsed.total_seconds()}

    Log To Console    Response Time : ${response_time} seconds

    Should Be True
    ...    ${response_time} < ${MAX_RESPONSE_TIME}

    Log To Console
    ...    API response time is within acceptable limit.