*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/common_resources.robot
Resource    ../../resources/Pages/TC-NEG-03.robot
Suite Setup       Launch Application
Suite Teardown    Close Application
*** Test Cases ***

TC-NEG-03 Fund Transfer With Negative Amount

    Ensure User Is Logged In

    Transfer Negative Amount