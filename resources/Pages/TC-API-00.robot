*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource    ../../variables/TC-API-00-locators.robot

*** Keywords ***
Get Accounts List By Customer Id

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

    Log To Console    Response Status Code : ${response.status_code}
    Log To Console    Response Body : ${response.text}

    Should Be Equal As Integers
    ...    ${response.status_code}
    ...    ${EXPECTED_STATUS}

    ${json_response}=    Set Variable    ${response.json()}

    Log To Console    Accounts JSON : ${json_response}

    Should Not Be Empty    ${json_response}