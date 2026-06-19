*** Settings ***
Library   SeleniumLibrary
Documentation    TS-16 - Create New CHECKING Account Successfully
Resource    ../../resources/Pages/TC-AC-UI-05.robot
Resource    ../../resources/common_resources.robot
Suite Setup       Launch Application
Suite Teardown    Close Application
*** Test Cases ***

TC-AC-UI-05 - Create New CHECKING Account Successfully
    [Documentation]    Verify that a user can create a new CHECKING account successfully and that a new account number is displayed.
    Ensure User Is Logged In
    Create New CHECKING Account Successfully