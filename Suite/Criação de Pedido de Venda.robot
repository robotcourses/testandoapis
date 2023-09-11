*** Settings ***
Test Tags  post_order
Library   RequestsLibrary
Resource  ../Resources/requests/post_order.robot
Resource  ../Resources/asserts/assert_post_orders.robot

*** Test Cases ***
Cenário: Criar Pedido de Venda com Um Item Com Endereço

    @{product}  Create List  Product A
    @{quantity}  Create List  ${2}
    @{price}  Create List  ${25}

    ${response}  request.post.orders
    ...  order_id=123456
    ...  status=Open
    ...  items_product=@{product}
    ...  items_quantity=@{quantity}
    ...  items_price=@{price}
    ...  status_code=201

    asserts.post.orders
    ...  response=${response}
    ...  products=@{product}

Cenário: Criar Pedido de Venda com Um Item Sem Endereço

    @{product}  Create List  Product A
    @{quantity}  Create List  ${2}
    @{price}  Create List  ${25}

    ${response}  request.post.orders
    ...  order_id=123456
    ...  status=Open
    ...  items_product=@{product}
    ...  items_quantity=@{quantity}
    ...  items_price=@{price}
    ...  shipping_address=${False}
    ...  status_code=201

    asserts.post.orders
    ...  response=${response}
    ...  products=@{product}

Cenário: Criar Pedido de Venda com Mais de Um Item

    @{product}  Create List  Product A  Product B  Product C
    @{quantity}  Create List  ${2}  ${3}  ${4}
    @{price}  Create List  ${25}  ${35}  ${45}

    ${response}  request.post.orders
    ...  order_id=123456
    ...  status=Open
    ...  items_product=@{product}
    ...  items_quantity=@{quantity}
    ...  items_price=@{price}
    ...  status_code=201

    asserts.post.orders
    ...  response=${response}
    ...  products=@{product}