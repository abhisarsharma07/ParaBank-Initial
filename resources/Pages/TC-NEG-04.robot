*** Settings ***
Library    SeleniumLibrary
Resource   ../../variables/TC-NEG-04-locators.robot

*** Keywords ***

Open Transfer Funds Page

    Click Link    Transfer Funds

    Wait Until Element Is Visible
    ...    ${AMOUNT_FIELD}
    ...    10s

    Sleep    2s


Transfer With Zero Amount

    Open Transfer Funds Page

    Select From List By Index
    ...    ${FROM_ACCOUNT_DROPDOWN}
    ...    0

    Select From List By Index
    ...    ${TO_ACCOUNT_DROPDOWN}
    ...    1

    Input Text
    ...    ${AMOUNT_FIELD}
    ...    0

    Sleep    2s

    Click Element
    ...    ${TRANSFER_BUTTON}

    Sleep    2s


Verify Zero Amount Rejected

    Page Should Not Contain
    ...    Transfer Complete!


Transfer With Non Numeric Amount

    Open Transfer Funds Page

    Select From List By Index
    ...    ${FROM_ACCOUNT_DROPDOWN}
    ...    0

    Select From List By Index
    ...    ${TO_ACCOUNT_DROPDOWN}
    ...    1

    Input Text
    ...    ${AMOUNT_FIELD}
    ...    abc

    Sleep    2s

    Click Element
    ...    ${TRANSFER_BUTTON}

    Sleep    2s

Verify Non Numeric Amount Rejected


    Wait Until Page Contains
    ...    Error!
    ...    10s

    Page Should Contain
    ...    An internal error has occurred and has been logged.