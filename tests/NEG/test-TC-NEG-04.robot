*** Settings ***
Resource    ../../resources/common_resources.robot
Resource    ../../resources/Pages/TC-NEG-04.robot

Test Setup       Launch Application
Test Teardown    Close Browser

*** Test Cases ***

TC-NEG-04A Fund Transfer With Zero Amount

    Ensure User Is Logged In

    Transfer With Zero Amount

    Verify Zero Amount Rejected


TC-NEG-04B Fund Transfer With Non Numeric Amount

    Ensure User Is Logged In

    Transfer With Non Numeric Amount

    Verify Non Numeric Amount Rejected