*** Settings ***
Resource    ../../resources/common_resources.robot
Resource    ../../resources/Pages/TC-TF-UI-04.robot

Suite Setup       Launch Application
Suite Teardown    Close Application

*** Test Cases ***

TC-TF-UI-04 Verify From And To Account Cannot Be Same

    Ensure User Is Logged In

    Transfer Funds Using Same Account

    Verify Same Account Validation