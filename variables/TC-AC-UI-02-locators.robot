*** Variables ***
## This is related to 1st one so all the things related to it are covereed in TC_AC_UI_01.robot file. This file is only for verifying the success message after account creation.
${OPEN_NEW_ACCOUNT_LINK}      xpath=//a[text()='Open New Account']
${ACCOUNT_TYPE_DROPDOWN}      id=type
${FROM_ACCOUNT_DROPDOWN}      id=fromAccountId
${OPEN_ACCOUNT_BUTTON}        xpath=//input[@value='Open New Account']
${NEW_ACCOUNT_ID}             id=newAccountId