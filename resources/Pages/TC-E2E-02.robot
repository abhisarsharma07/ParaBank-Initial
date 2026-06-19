*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections

Resource   ../../variables/TC-E2E-02-locators.robot

*** Keywords ***

Get Account Balance From API

    [Arguments]    ${account_id}

    ${cookie}=    Get Cookie    JSESSIONID

    ${cookies}=    Create Dictionary
    ...    JSESSIONID=${cookie.value}

    Create Session
    ...    bank
    ...    https://parabank.parasoft.com
    ...    verify=False

    ${headers}=    Create Dictionary
    ...    Accept=application/json

    ${response}=    GET On Session
    ...    bank
    ...    /parabank/services_proxy/bank/accounts/${account_id}
    ...    headers=${headers}
    ...    cookies=${cookies}
    ...    expected_status=any

    ${json}=    Evaluate    $response.json()

    RETURN    ${json["balance"]}

Perform Transfer

    [Arguments]
    ...    ${amount}

    Click Link    Transfer Funds

    Wait Until Element Is Visible
    ...    ${AMOUNT_FIELD}
    ...    10s

    Sleep    2s

    ${from_options}=    Get List Items
    ...    ${FROM_ACCOUNT_DROPDOWN}

    ${to_options}=    Get List Items
    ...    ${TO_ACCOUNT_DROPDOWN}

    Log To Console
    ...    From Accounts: ${from_options}

    Log To Console
    ...    To Accounts: ${to_options}

    ${from_account}=    Set Variable
    ...    ${from_options}[0]

    ${to_account}=    Set Variable
    ...    ${to_options}[1]

    ${before_from}=    Get Account Balance From API
    ...    ${from_account}

    ${before_to}=    Get Account Balance From API
    ...    ${to_account}

    Log To Console
    ...    Before From: ${before_from}

    Log To Console
    ...    Before To: ${before_to}

    Select From List By Label
    ...    ${FROM_ACCOUNT_DROPDOWN}
    ...    ${from_account}

    Select From List By Label
    ...    ${TO_ACCOUNT_DROPDOWN}
    ...    ${to_account}

    Input Text
    ...    ${AMOUNT_FIELD}
    ...    ${amount}

    Click Element
    ...    ${TRANSFER_BUTTON}

    Wait Until Page Contains
    ...    Transfer Complete!
    ...    10s

    Log To Console
    ...    Transfer Completed Successfully

    RETURN
    ...    ${from_account}
    ...    ${to_account}
    ...    ${before_from}
    ...    ${before_to}

Validate Balance Changes

    [Arguments]
    ...    ${from_account}
    ...    ${to_account}
    ...    ${amount}
    ...    ${before_from}
    ...    ${before_to}

    Log To Console    Before From: ${before_from}
    Log To Console    Before To: ${before_to}
    ${after_from}=    Get Account Balance From API
    ...    ${from_account}

    ${after_to}=    Get Account Balance From API
    ...    ${to_account}

    ${expected_from}=    Evaluate
    ...    float(${before_from}) - float(${amount})

    ${expected_to}=    Evaluate
    ...    float(${before_to}) + float(${amount})

    Should Be Equal As Numbers
    ...    ${after_from}
    ...    ${expected_from}

    Should Be Equal As Numbers
    ...    ${after_to}
    ...    ${expected_to}