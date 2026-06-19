*** Settings ***
Library    RequestsLibrary
Library    Collections

Resource    ../../variables/TC-API-05-locators.robot

*** Keywords ***

Validate Balance Update After Transfer

    Create Session
    ...    ParaBank
    ...    ${BASE_URL}
    ...    verify=False

    ${headers}=    Create Dictionary
    ...    Accept=${ACCEPT_HEADER}

    # From Account Balance Before
    ${from_before_response}=    GET On Session
    ...    ParaBank
    ...    /accounts/${FROM_ACCOUNT_ID}
    ...    headers=${headers}

    ${from_before_json}=    Set Variable    ${from_before_response.json()}
    ${from_before_balance}=    Set Variable    ${from_before_json['balance']}

    # To Account Balance Before
    ${to_before_response}=    GET On Session
    ...    ParaBank
    ...    /accounts/${TO_ACCOUNT_ID}
    ...    headers=${headers}

    ${to_before_json}=    Set Variable    ${to_before_response.json()}
    ${to_before_balance}=    Set Variable    ${to_before_json['balance']}

    Log To Console    From Account Balance Before : ${from_before_balance}
    Log To Console    To Account Balance Before : ${to_before_balance}

    # ========= UI Transfer yahan hona chahiye =========

    Sleep    5s

    # From Account Balance After
    ${from_after_response}=    GET On Session
    ...    ParaBank
    ...    /accounts/${FROM_ACCOUNT_ID}
    ...    headers=${headers}

    ${from_after_json}=    Set Variable    ${from_after_response.json()}
    ${from_after_balance}=    Set Variable    ${from_after_json['balance']}

    # To Account Balance After
    ${to_after_response}=    GET On Session
    ...    ParaBank
    ...    /accounts/${TO_ACCOUNT_ID}
    ...    headers=${headers}

    ${to_after_json}=    Set Variable    ${to_after_response.json()}
    ${to_after_balance}=    Set Variable    ${to_after_json['balance']}

    Log To Console    From Account Balance After : ${from_after_balance}
    Log To Console    To Account Balance After : ${to_after_balance}

    Should Be True    ${from_after_balance} < ${from_before_balance}
    Should Be True    ${to_after_balance} > ${to_before_balance}

    Log To Console    From Account balance decreased successfully.
    Log To Console    To Account balance increased successfully.