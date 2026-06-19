#Verify Success Message After Account Creation
*** Settings ***
Library   SeleniumLibrary
Resource    ../../variables/TC-AC-UI-02-locators.robot
*** Keywords ***
Verify Account Creation Success Message

    Page Should Contain
    ...    Congratulations, your account is now open.
    
    Sleep    5s