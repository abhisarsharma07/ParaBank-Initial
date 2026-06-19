*** Settings ***
Resource    ../../resources/common_resources.robot
Resource    ../../resources/Pages/TC-NEG-05.robot

Test Setup       Launch Application
Test Teardown    Close Browser

*** Test Cases ***

TC-NEG-05 Fund Transfer With Insufficient Balance

    Ensure User Is Logged In

    Transfer Amount Greater Than Balance

    Verify Insufficient Balance Validation