*** Settings ***
Library     RequestsLibrary
Variables   ../test_data/test_data.yaml

*** Variables ***
${env}

*** Keywords ***
session.orders
    [Return]
    ...  ${alias}

    ${alias}  Set Variable  orders

    ${headers}  Create Dictionary  user_id=user_1
    ${cookies}  Create Dictionary  _id=1234
    ${auth}  Create List  ${user_data.${env}.user_email}  ${user_data.${env}.password}

    Create Session
    ...  alias=${alias}
    ...  url=${url.${env}}
    ...  disable_warnings=${True}
    ...  headers=${headers}
    ...  cookies=${cookies}
    ...  auth=${auth}