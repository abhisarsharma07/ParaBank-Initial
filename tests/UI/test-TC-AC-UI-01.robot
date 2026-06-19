*** Settings ***
Library  SeleniumLibrary
Resource    ../../resources/common_resources.robot
Resource    ../../resources/Pages/TC-AC-UI-01.robot

Suite Setup       Launch Application
Suite Teardown    Close Application

*** Test Cases ***

TC-AC-UI-01 Create New Account With Valid Data

    Ensure User Is Logged In

    Create New Account

    ${account_id}=    Capture Account ID

    Should Not Be Empty    ${account_id}