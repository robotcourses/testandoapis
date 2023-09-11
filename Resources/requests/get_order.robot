*** Settings ***
Library  RequestsLibrary
Resource  ../session/order_session.robot

*** Keywords ***
requests.get.orders
    [Arguments]
    ...  ${order_id}
    ...  ${status_code}
    [Return]
    ...  ${response}

    ${alias}  session.orders

    ${headers}  Create Dictionary  robot=True

    ${response}  GET On Session
    ...  alias=${alias}
    ...  url=/posts/${order_id}
    ...  headers=${headers}
    ...  expected_status=${status_code}
    ...  msg=Falha ao realizar requisição GET