Meta:
@feature AddGiftCard, GiftCard
@acceptance UGPW-3885
@history UGPW-5249
@countryMeta US CA MX INTL
@auth
@guest

Scenario: Verify order total and payment amount recalculated after gift card is applied.
Meta:
@c1

Given aeSite header set as <aeSite>
And user type <userType>
When I add 'commerce' item 'without promotion' with quantity 1
Then there are no errors and status is success
When I add shipping address to cart: commerce/data/common/shippingAddress/<shippingAddress>
Then there are no errors and status is success
When I add gift card 'Gift_Card_25_USD_03'
testing for multi lines
Then there are no errors and status is success
When I view cart
Then payment response contains correct recalculated payment amount
When I add 'commerce' item 'without promotion' with quantity 1
When I view cart
Then payment response contains correct recalculated payment amount