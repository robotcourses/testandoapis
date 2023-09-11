*** Settings ***
Test Tags  get_order
Resource  ../Resources/requests/get_order.robot
Resource  ../Resources/asserts/asserts_get_orders.robot

*** Test Cases ***
Cenário: Realizar Pesquisa de Pedido de Venda

        ${response}  requests.get.orders
        ...  order_id=1
        ...  status_code=200

        asserts.get.orders
        ...  response=${response}

Cenário: Realizar Pesquisa de Pedido de Venda Inexistente

        ${response}  requests.get.orders
        ...  order_id=999
        ...  status_code=404

        asserts.get.orders
        ...  response=${response}