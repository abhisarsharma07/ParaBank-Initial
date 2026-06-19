*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/login_locators.robot

*** Keywords ***

Login User

    Input Text    ${LOGIN_USERNAME}    abhisar
    Input Text    ${LOGIN_PASSWORD}    1234

    Click Element    ${LOGIN_BUTTON}