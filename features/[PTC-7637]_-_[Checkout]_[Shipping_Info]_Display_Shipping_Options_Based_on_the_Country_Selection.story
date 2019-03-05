[PTC-7637] - [Checkout] [Shipping Info] Display Shipping Options Based on the Country Selection
UGPW-4458 - [QE/UI] Design layout view of CA Site checkout
UGPW-4456 - [QE/UI] Design layout view of US Site Checkout

Narrative:
As a customer, I want to view the shipping methods that
I have available to me for the shipping address that I have entered.

Meta:
@Author Velta Fisher
@acceptance PTC-7637 UGPPTCUI-430
@country US CA MX INTL

Scenario: verifying user is able to select shipping method
Meta:
@c1

Given this has many lines
also
When user opens checkout page
testing multiple line
Given 1 regular product is added to Cart via services for a current UI session
When user fills/edits shipping address for different countries: com/aeo/testdata/common/shippingAddress/<shippingAddress>
And user clicks shipping options block
Then verifying info message is displayed for a moment
And verifying info message is not displayed
When user selects shipping method <shipMethod>
Then shipping method <shipMethod> is selected

Examples:
|Meta:                        |shippingAddress         |shipMethod |
|@country US                  |address_US_CA.table     |Standard   |
|@country US                  |address_US_CA.table     |Two Day    |
|@country US                  |address_US_CA.table     |Overnight  |
|@country US @skip UGPW-7009  |address_US_CA.table     |SHOP RUNNER|
|@country CA                  |address_CA_MB.table     |Standard   |
|@country INTL                |address_INTL_India.table|Express    |
|@country INTL                |address_INTL_India.table|Standard   |


Scenario: verifying selected shipping method still persist after cart item is removed from checkout page
Meta:
@history PTC-7889
@c2
@not_stable because of step - processing spinner.

 
Given 1 regular product is added to Cart via services for a current UI session
And user adds product GD_regPrd1 with 1 quantity to cart from services
When user opens checkout page
And user fills/edits shipping address for different countries: com/aeo/testdata/common/shippingAddress/<shippingAddress>
And user clicks shipping options block
Then verifying info message is displayed for a moment
And verifying info message is not displayed
When user selects shipping method <shipMethod>
Then shipping method <shipMethod> is selected
When user removes product GD_regPrd1 from checkout page
Then processing spinner is displayed for a moment
And processing spinner is not displayed
And shipping method <shipMethod> is selected

Examples:
|Meta:                        |shippingAddress         |shipMethod |
|@country US                  |address_US_CA.table     |Standard   |
|@country US                  |address_US_CA.table     |Two Day    |
|@country US                  |address_US_CA.table     |Overnight  |
|@country US @skip UGPW-7009  |address_US_CA.table     |SHOP RUNNER|
|@country CA                  |address_CA_MB.table     |Standard   |
|@country INTL                |address_INTL_India.table|Express    |
|@country INTL                |address_INTL_India.table|Standard   |


Scenario: verifying selected shipping method still persist after cart item is edited from cart page

Meta:
@history UGPW-3688, UGPPTPUI-1435 UGPPTPUI-1730
@c2

Given 1 regular product is added to Cart via services for a current UI session
When user opens checkout page
And user fills/edits shipping address for different countries: com/aeo/testdata/common/shippingAddress/<shippingAddress>
And user clicks shipping options block
Then verifying info message is displayed for a moment
And verifying info message is not displayed
When user selects shipping method <shipMethod>
Then shipping method <shipMethod> is selected
When user clicks on cart link
And user opens edit block for cart item GD_regPrd2 by edit link
And user increases quantity 2 times in edit item block
And user clicks update button in edit item block
Then product GD_regPrd2 has item quantity 3
When user clicks checkout button
Then shipping method <shipMethod> is selected

Examples:
|Meta:                        |shippingAddress         |shipMethod |
|@country US                  |address_US_CA.table     |Standard   |
|@country US                  |address_US_CA.table     |Two Day    |
|@country US                  |address_US_CA.table     |Overnight  |
|@country US @skip UGPW-7009  |address_US_CA.table     |SHOP RUNNER|
|@country CA                  |address_CA_MB.table     |Standard   |
|@country INTL                |address_INTL_India.table|Express    |
|@country INTL                |address_INTL_India.table|Standard   |


Scenario: verifying selected shipping method still persist after cart item is removed from cart page
Meta:
@history UGPW-3688
@c2

Given 1 regular product is added to Cart via services for a current UI session
And user adds product GD_regPrd1 with 1 quantity to cart from services
When user opens checkout page
And user fills/edits shipping address for different countries: com/aeo/testdata/common/shippingAddress/<shippingAddress>
And user clicks shipping options block
Then verifying info message is displayed for a moment
And verifying info message is not displayed
When user selects shipping method <shipMethod>
Then shipping method <shipMethod> is selected
When user clicks on cart link
And user removes product GD_regPrd1 from cart
And user opens checkout page
Then shipping method <shipMethod> is selected

Examples:
|Meta:                        |shippingAddress         |shipMethod |
|@country US                  |address_US_CA.table     |Standard   |
|@country US                  |address_US_CA.table     |Two Day    |
|@country US                  |address_US_CA.table     |Overnight  |
|@country US @skip UGPW-7009  |address_US_CA.table     |SHOP RUNNER|
|@country CA                  |address_CA_MB.table     |Standard   |
|@country INTL                |address_INTL_India.table|Express    |
|@country INTL                |address_INTL_India.table|Standard   |


Scenario: verifying selected shipping method still persist after cart item is edited from checkout page
Meta:
@c3
@history UGPPTPUI-1435

Given 1 regular product is added to Cart via services for a current UI session
When user opens checkout page
And user fills/edits shipping address for different countries: com/aeo/testdata/common/shippingAddress/<shippingAddress>
And user clicks shipping options block
Then verifying info message is displayed for a moment
And verifying info message is not displayed
When user selects shipping method <shipMethod>
Then shipping method <shipMethod> is selected
When user opens edit block for for first cart item on Checkout page
And user increases quantity 2 times in edit item block
And user clicks update button in edit item block
test for multi lines Update 2
Then shipping method <shipMethod> is selected

Examples:
|Meta:                        |shippingAddress         |shipMethod |
|@country US                  |address_US_CA.table     |Standard   |
|@country US                  |address_US_CA.table     |Two Day    |
|@country US                  |address_US_CA.table     |Overnight  |
|@country US @skip UGPW-7009  |address_US_CA.table     |SHOP RUNNER|
|@country CA                  |address_CA_MB.table     |Standard   |
|@country INTL                |address_INTL_India.table|Express    |
|@country INTL                |address_INTL_India.table|Standard   |


Scenario: vefirying shipping method section remembered after user goes to cart page and back
Meta:
@c2
@acceptance PTC-7210 UGPPTCUI-251
@history @UGPW-3894

Given 1 regular product is added to Cart via services for a current UI session
When user opens checkout page
And user fills/edits shipping address for different countries: com/aeo/testdata/common/shippingAddress/<shippingAddress>
And user clicks shipping options block
Then verifying info message is displayed for a moment
And verifying info message is not displayed
When user selects shipping method <shipMethod>
Then shipping method <shipMethod> is selected
When user clicks on cart link
Then user is on Shopping Cart page
When user clicks on proceed to checkout button
Then user is on the Checkout page
And shipping method <shipMethod> is selected 1111

Examples:
|Meta:                        |shippingAddress         |shipMethod |
|@country US                  |address_US_CA.table     |Standard   |
|@country US                  |address_US_CA.table     |Two Day    |
|@country US                  |address_US_CA.table     |Overnight  |
|@country US @skip UGPW-7009  |address_US_CA.table     |SHOP RUNNER|
|@country CA                  |address_CA_MB.table     |Standard   |
|@country INTL                |address_INTL_India.table|Express    |
|@country INTL                |address_INTL_India.table|Standard   |


Scenario: US APO/FPO/DPO - shipping methods are correct and can be selected, there is no Shoprunner section
Meta:
@c2
@history UGPW-6818
@acceptance UGPW-4456

Given 1 regular product is added to Cart via services for a current UI session
When user opens checkout page
And user changes country in Shipping Address block to APO/FPO/DPO
When user fills/edits shipping address for different countries: com/aeo/testdata/common/shippingAddress/<shippingAddress>
And user clicks shipping options block
Then verifying info message is displayed for a moment
And verifying info message is not displayed
When user selects shipping method <shipMethod>
Then shipping method <shipMethod> is selected
And Checkout Shoprunner section is not displayed

Examples:
|Meta:      |shippingAddress             |shipMethod|
|@country US|address_US_APO_FPO_DPO.table|Standard  |


Scenario: verifying shipping method section ins't reloaded if shipping address is invalid
Meta:
@c2

Given 1 regular product is added to Cart via services for a current UI session
And user adds product GD_regPrd1 with 1 quantity to cart from services
When user opens checkout page
And user fills/edits shipping address for different countries:
{transformer=FROM_LANDSCAPE}
|firstname     |Jhon           |
|lastname      |Smith          |
|states        |<states>       |
|streetAddress |Red hawk circle|
|streetAddress2|apt. L308      |
|city          |12             |
|postalCode    |<postalCode>   |
Then shipping address fields have errors:
{transformer=FROM_LANDSCAPE}
|city|error.checkout.shipping_address.city.too_short|
And verifying info message is not displayed

Examples:
|Meta:        |<states> |<postalCode>|
|@country US  |IL       |60601       |
|@country CA  |MB       |K8N 5W6     |
|@country INTL|SomeState|12345       |


Scenario: CA/INTL Auth - there is no Shoprunner section
Meta:
@c1
@acceptance UGPW-4458
@country CA INTL

Given random account is created and user is logged in
And 1 regular product is added to Cart via services for a current UI session
When user opens checkout page
Then Checkout Shoprunner section is not displayed
When user fills/edits shipping address for different countries: com/aeo/testdata/common/shippingAddress/<shippingAddress>
And user clicks shipping options block
Then verifying info message is displayed for a moment
And verifying info message is not displayed
And Checkout Shoprunner section is not displayed

Examples:
|Meta:        |shippingAddress         |
|@country CA  |address_CA_MB.table     |
|@country INTL|address_INTL_India.table|


Scenario: CA/INTL Guest - there is no Shoprunner section
Meta:
@c1
@acceptance UGPW-4458
@country CA INTL

Given 1 regular product is added to Cart via services for a current UI session
When user opens checkout page
Then Checkout Shoprunner section is not displayed
When user fills/edits shipping address for different countries: com/aeo/testdata/common/shippingAddress/<shippingAddress>
And user clicks shipping options block
Then verifying info message is displayed for a moment
And verifying info message is not displayed
And Checkout Shoprunner section is not displayed

Examples:
|Meta:        |shippingAddress         |
|@country CA  |address_CA_MB.table     |
|@country INTL|address_INTL_India.table|


Scenario: CA/INTL Auth with saved ship address - there is no Shoprunner section
Meta:
@c1
@acceptance UGPW-4458
@country CA INTL

Given random account is created and user is logged in
And 1 regular product is added to Cart via services for a current UI session
When I add shipping address to users profile: com/aeo/testdata/common/shippingAddress/profile/<shippingAddress>
And user opens checkout page
Then Checkout Shoprunner section is not displayed

Examples:
|Meta:        |shippingAddress |
|@country CA  |address_CA.table|
|@country INTL|address_IN.table|


Scenario: US Auth - Shoprunner section is displayed
Meta:
@c1
@acceptance UGPW-4458
@skip UGPW-7009
@country US

Given random account is created and user is logged in
And 1 regular product is added to Cart via services for a current UI session
When user opens checkout page
Then Checkout Shoprunner section is displayed
When user fills/edits shipping address for different countries: com/aeo/testdata/common/shippingAddress/address_US_CA.table
And user clicks shipping options block
Then verifying info message is displayed for a moment
And verifying info message is not displayed
testing multi lines
And Checkout Shoprunner section is displayed


Scenario: US Guest - Shoprunner section is displayed
Meta:
@c1
@acceptance UGPW-4458
@skip UGPW-7009
@country US

Given 1 regular product is added to Cart via services for a current UI session
When user opens checkout page
Then Checkout Shoprunner section is displayed
When user fills/edits shipping address for different countries: com/aeo/testdata/common/shippingAddress/address_US_CA.table
And user clicks shipping options block
Then verifying info message is displayed for a moment
And verifying info message is not displayed
And Checkout Shoprunner section is displayed


Scenario: US Auth with saved ship address - Shoprunner section is displayed
Meta:
@c1
@acceptance UGPW-4458
@skip UGPW-7009
@country US

Given random account is created and user is logged in
And 1 regular product is added to Cart via services for a current UI session
When I add shipping address to users profile: com/aeo/testdata/common/shippingAddress/profile/address_US.table
And user opens checkout page
Then Checkout Shoprunner section is displayed

After:
  testing - update
  
  
  