*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/Keyword_Login.robot

*** Keywords ***
Search Product
    [Arguments]    ${Product}
    input text    id=search_query_top    ${Product}
    wait until page contains element    xpath=//*[@id="index"]/div[2]/ul/li[3]
    press keys    xpath=//*[@id="index"]/div[2]/ul/li[3]    ENTER

Click Add to Cart Button
    click element    id=add_to_cart

Click Proceed to checkout1 Button
    wait until element is visible    xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span
    click element    xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span

Click Proceed to checkout2 Button
    click element    xpath=//*[@id="center_column"]/p[2]/a[1]/span

Sign In Account already Register
    [Arguments]    ${User}
    input text    id=email    ${User.email}
    input text    id=passwd    ${User.password}
    click element    id=SubmitLogin

Get Name Sign In Successfully
    wait until page contains element    xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a
    ${Name} =    get text    xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a
    [Return]    ${Name}

Verify Sign In Successfully
    ${Name} =   Get Name Sign In Successfully
    should be equal as strings    ${Name}     thu nguyen


Click Proceed to checkout3 Button
    click element    xpath=//*[@id="center_column"]/form/p/button/span

Check Terms of service
    select checkbox    cgv

Click Proceed to checkout4 Button
     click element    xpath=//*[@id="form"]/p/button

Choose Pay by bank wire
    click element    xpath=//*[@id="HOOK_PAYMENT"]/div[1]/div/p

Click I Confirm My Order Button
    click element    xpath=//*[@id="cart_navigation"]/button

Get Text Confirm Add Product Succesfully
    wait until page contains element    xpath=//*[@id="layer_cart"]/div[1]/div[1]/h2
    ${Confirm} =    get text    xpath=//*[@id="layer_cart"]/div[1]/div[1]/h2
    [Return]    ${Confirm}

Verify Confirm Add Product Successfully
    ${Confirm} =    Get Text Confirm Add Product Succesfully
    should be equal as strings    ${Confirm}    Product successfully added to your shopping cart

Get Value after Increase quantity
    wait until page contains element    xpath=//*[@id="quantity_wanted"]
    ${Value} =    get value    xpath=//*[@id="quantity_wanted"]
    [Return]    ${Value}

Verify Value after Increase quantity
    ${Value} =    Get Value after Increase quantity
    should be equal as integers    ${Value}    2

Get Text Confirm
    wait until page contains element    xpath=//*[@id="center_column"]/div/p
    ${ConfirmationText} =    get text    xpath=//*[@id="center_column"]/div/p
    [Return]    ${ConfirmationText}

Verify Confirm that Product is ordered
    ${Confirm} =    Get Text Confirm
    should be equal as strings    ${Confirm}    Your order on My Store is complete.

Choose the First Product in Homepage
    scroll element into view    xpath=//*[@id="homefeatured"]/li[1]
    click element    xpath=//*[@id="homefeatured"]/li[1]/div/div[2]/div[2]/a[2]/span

Increase quantity is 1
    wait until element is visible    xpath=//*[@id="quantity_wanted_p"]/a[2]
    click element    xpath=//*[@id="quantity_wanted_p"]/a[2]

Choose Size for Product
    select from list by value    group_1    2

Choose color is Blue
    click element    xpath=//*[@id="color_to_pick_list"]/li[2]

Get Message Wishlist
    wait until page contains element    xpath=//*[@id="category"]/div[2]/div/div/div
    ${Message} =    get text    xpath=//*[@id="category"]/div[2]/div/div/div
    [Return]    ${Message}

Verify Message Wishlist
    ${Mgs} =    Get Message Wishlist
    should be equal as strings    ${Mgs}    You must be logged in to manage your wishlist.

Choose Product from Navigate
    mouse over    //*[@id="block_top_menu"]/ul/li[1]
    wait until page contains element    //*[@id="block_top_menu"]/ul/li[1]/ul/li[1]/ul/li[1]
    click element    //*[@id="block_top_menu"]/ul/li[1]/ul/li[1]/ul/li[1]/a

Click Wishlist button of the first product
    wait until page contains element    //*[@id="center_column"]/ul/li
    scroll element into view    //*[@id="center_column"]/ul/li
    wait until element is visible    //*[@id="center_column"]/ul/li/div/div[3]/div[1]
    click element    //*[@id="center_column"]/ul/li/div/div[3]/div[1]

Get Total Price
    wait until page contains element    id=total_product_price_1_1_0
    ${Total} =    get value    id=total_product_price_1_1_0
    [Return]    ${Total}

Verify that Total price is changing and reflecting correct price
    ${Total} =    Get Total Price
    should be equal as integers    ${Total}    33.02

Login Successfully
    [Arguments]    ${User}
    Go to Login page
    Input Email    ${User.email}
    Input Password    ${User.password}
    Click Submit Button

Get Message Wishlist Successfully
    wait until page contains element    xpath=//*[@id="category"]/div[2]/div/div/div
    ${Message} =    get text    xpath=//*[@id="category"]/div[2]/div/div/div
    [Return]    ${Message}

Verify Message add Wishlist successfully
    ${Mgs} =    Get Message Wishlist Successfully
    should be equal as strings    ${Mgs}    Added to your wishlist.

Get Empty
    wait until page contains element    //*[@id="header"]/div[3]/div/div/div[3]/div/a/span[5]
    ${Message} =    get text    //*[@id="header"]/div[3]/div/div/div[3]/div/a/span[5]
    [Return]    ${Message}

Verify Empty Cart
    ${Mgs} =    Get Empty
    should be equal as strings    ${Mgs}    (empty)

Choose Product
    wait until element is visible    //*[@id="center_column"]/ul
    scroll element into view    //*[@id="center_column"]/ul

Hover Product
    wait until element is visible    //*[@id="center_column"]/ul/li
    mouse over    //*[@id="center_column"]/ul/li

Click Add to Cart
    click element    //*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]

Remove Layer Cart
    wait until element is visible    id=layer_cart
    click element    //*[@id="layer_cart"]/div[1]/div[1]/span

Hover Shopping Cart
    wait until element is visible    //*[@id="header"]/div[3]/div/div/div[3]/div
    mouse over    //*[@id="header"]/div[3]/div/div/div[3]/div/a

Remove Product
    wait until element is visible    //*[@id="header"]/div[3]/div/div/div[3]/div/div
    click element    //*[@id="header"]/div[3]/div/div/div[3]/div/div/div/div/dl/dt/span



