*** Settings ***
Library  SeleniumLibrary
Resource    ../../resources/common_resources.robot
Resource    ../../resources/Pages/TC-AC-UI-01.robot
Resource    ../../resources/Pages/TC-AC-UI-02.robot


Suite Setup       Launch Application
Suite Teardown    Close Application

*** Test Cases ***

TC-AC-UI-02 Verify Success Message After Account Creation

    Ensure User Is Logged In

    Create New Account

    Verify Account Creation Success Message

