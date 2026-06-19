*** Settings ***
Library  SeleniumLibrary
Resource    ../../resources/common_resources.robot
Resource    ../../resources/Pages/TC-AC-UI-04.robot
Suite Setup       Launch Application
Suite Teardown    Close Application
*** Test Cases ***

TC-AC-UI-04 Verify New Account Appears In Account Overview

    Ensure User Is Logged In

    Create New Account

    ${account_id}=    Capture Account ID

    Open Account Overview

    Sleep    2s

    Verify Account Present In Overview
    ...    ${account_id}