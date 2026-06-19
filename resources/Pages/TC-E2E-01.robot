*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Resource   ../../variables/TC-E2E-01-locators.robot

*** Keywords ***

Create Account And Capture Details

    Click Link    Open New Account

    Wait Until Element Is Visible
    ...    ${ACCOUNT_TYPE_DROPDOWN}
    ...    10s

    Select From List By Label
    ...    ${ACCOUNT_TYPE_DROPDOWN}
    ...    SAVINGS

    Sleep    2s

    Click Element
    ...    ${OPEN_ACCOUNT_BUTTON}

    Wait Until Element Is Visible
    ...    ${NEW_ACCOUNT_ID}
    ...    10s

    ${account_id}=    Get Text
    ...    ${NEW_ACCOUNT_ID}

    RETURN    ${account_id}

Validate Account Exists Via API

    [Arguments]    ${account_id}

    ${cookie}=    Get Cookie    JSESSIONID

    Log To Console
    ...    Cookie Name: ${cookie.name}

    Log To Console
    ...    Cookie Value: ${cookie.value}

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

    Log To Console
    ...    Status Code: ${response.status_code}

    Log To Console
    ...    Response: ${response.text}

    Should Be Equal As Integers
    ...    ${response.status_code}
    ...    200

    Should Contain
    ...    ${response.text}
    ...    ${account_id}