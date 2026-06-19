*** Settings ***
Documentation    TS-06 - Validate Balance Update After Transfer
Resource    ../../resources/Pages/TC-API-05.robot

*** Test Cases ***
TC-API-05 - Validate Balance Update After Transfer
    [Documentation]    Verify balances are updated correctly after fund transfer
    Validate Balance Update After Transfer