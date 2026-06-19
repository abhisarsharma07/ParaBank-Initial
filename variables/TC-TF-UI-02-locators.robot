*** Variables ***

${TRANSFER_FUNDS_LINK}      xpath=//a[text()='Transfer Funds']
${AMOUNT_FIELD}             id=amount
${FROM_ACCOUNT_DROPDOWN}    id=fromAccountId
${TO_ACCOUNT_DROPDOWN}      id=toAccountId
${TRANSFER_BUTTON}          xpath=//input[@value='Transfer']

${TRANSFER_COMPLETE_MSG}    xpath=//h1[contains(text(),'Transfer Complete')]