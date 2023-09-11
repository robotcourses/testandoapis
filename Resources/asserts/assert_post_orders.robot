*** Settings ***
Resource  ../requests/post_order.robot
Library   JSONLibrary

*** Keywords ***
asserts.post.orders
    [Arguments]
    ...  ${response}
    ...  ${products}

    Should Be Equal As Strings    ${response.json()['order']['order_id']}           ${body['order']['order_id']}
    Should Be Equal As Integers   ${response.json()['order']['total_price']}        ${body['order']['total_price']}
    Should Be Equal As Strings    ${response.json()['order']['status']}             ${body['order']['status']}
    Should Be Equal As Strings    ${response.json()['order']['customer']['name']}   ${body['order']['customer']['name']}
    Should Be Equal As Strings    ${response.json()['order']['customer']['email']}  ${body['order']['customer']['email']}

    FOR    ${product}    IN    @{products}
        ${body_items}  Get Value From Json    ${body}    $.order.items[?(@.product=="${product}")]
        ${response_items}  Get Value From Json    ${response.json()}    $.order.items[?(@.product=="${product}")]

        Should Be Equal As Strings    ${response_items[0]['product']}   ${body_items[0]['product']}
        Should Be Equal As Integers   ${response_items[0]['quantity']}  ${body_items[0]['quantity']}
        Should Be Equal As Integers   ${response_items[0]['price']}     ${body_items[0]['price']}
    END

    Should Be Equal As Strings    ${response.json()['order']['shipping_address']['street']}     ${body['order']['shipping_address']['street']}
    Should Be Equal As Strings    ${response.json()['order']['shipping_address']['city']}       ${body['order']['shipping_address']['city']}
    Should Be Equal As Strings    ${response.json()['order']['shipping_address']['zipcode']}    ${body['order']['shipping_address']['zipcode']}