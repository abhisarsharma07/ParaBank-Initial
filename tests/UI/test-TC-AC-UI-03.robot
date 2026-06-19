#Mandatory Field Validation — Account Type Not Selected
*** Settings ***
Library  SeleniumLibrary
Resource    ../../resources/common_resources.robot
Resource    ../../resources/Pages/TC-AC-UI-01.robot
Resource    ../../resources/Pages/TC-AC-UI-02.robot
Resource    ../../resources/Pages/TC-AC-UI-03.robot
Suite Setup       Launch Application
Suite Teardown    Close Application

*** Test Cases ***
TC-AC-UI-03 Mandatory Field Validation Account Type Not Selected

    [Documentation]    Not Applicable. Account Type is pre-selected by application and cannot be left blank.

    Pass Execution    Scenario is not applicable because Account Type is always selected by default.