*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/Common_Keyword.robot
Resource    ../Resource/Keyword_Buy_Product.robot

Test Setup    User Open Browser
Test Teardown    User Close Browser

*** Variables ***
&{USER1} =    email=thu1@mailinator.com    password=12345


*** Test Cases ***
#Buy Product Successfully from Search
#    Search Product    dress
#    Click Add to Cart Button
#    sleep    3s
#    Verify Confirm Add Product Successfully
#    Click Proceed to checkout1 Button
#    Click Proceed to checkout2 Button
#    Sign In Account already Register    ${USER1}
#    Verify Sign In Successfully
#    Click Proceed to checkout3 Button
#    Check Terms of service
#    Click Proceed to checkout4 Button
#    Choose Pay by bank wire
#    Click I Confirm My Order Button
#    Verify Confirm that Product is ordered
#
#Buy Product Successfully from Homepage
#    Choose the First Product in Homepage
#    Increase quantity is 1
#    Verify Value after Increase quantity
#    Choose Size for Product
#    Choose color is Blue
#    Click Add to Cart Button
#    sleep    3s
#    Verify Confirm Add Product Successfully
#    Click Proceed to checkout1 Button
#    Click Proceed to checkout2 Button
#    Sign In Account already Register    ${USER1}
#    Verify Sign In Successfully
#    Click Proceed to checkout3 Button
#    Check Terms of service
#    Click Proceed to checkout4 Button
#    Choose Pay by bank wire
#    Click I Confirm My Order Button
#    Verify Confirm that Product is ordered

#Verify that 'Add to Wishlist' Unsuccessfully
#    Choose Product from Navigate
#    Click Wishlist button of the first product
#    Verify Message Wishlist

#Verify that 'Add to WishList' Successfully
#    Login Successfully    ${USER1}
#    Choose Product from Navigate
#    Click Wishlist button of the first product
#    sleep    3s
#    Verify Message add Wishlist successfully

#Verify Remove Product Successfully in Cart block List
#    Choose Product from Navigate
#    Choose Product
#    Hover Product
#    Click Add to Cart
#    Remove Layer Cart
#    Hover Shopping Cart
#    Remove Product
#    sleep    3s
#    Verify Empty Cart


Verify that Total Price is reflecting correctly if user changes quantity on 'Shopping Cart Summary' Page.
    scroll element into view    //*[@id="homefeatured"]/li[1]
    click element    //*[@id="homefeatured"]/li[1]/div/div[2]/div[2]/a[2]/span
    sleep    3s
    select from list by value    group_1    2
    sleep    3s
    click element    //*[@id="color_to_pick_list"]/li[2]
    click element    id=add_to_cart
    wait until element is visible    xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span
    click element    xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span
    scroll element into view    //*[@id="center_column"]/p[2]
    wait until element is visible    //*[@id="cart_quantity_up_1_1_0_0"]
    click element    //*[@id="cart_quantity_up_1_1_0_0"]
    Verify that Total price is changing and reflecting correct price



