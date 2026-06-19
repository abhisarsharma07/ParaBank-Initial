*** Settings ***
Library     RequestsLibrary
Resource    ../../resources/Pages/TC-NEG-06.robot

*** Test Cases ***

TC-NEG-06 API Validation For Invalid Account ID

    ${response}=    Get Invalid Account Details

    Should Be Equal As Integers
    ...    ${response.status_code}
    ...    401