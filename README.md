# abap_email_building_framework
 ABAP Email Building Framework

For more information about this framework read:
SAP Blog post "ABAP Email Building Framework using XSLT and SO10".

# Language and country specific parameters
- country_key parameter: The business should decide which country key field should be used. So it could be for example that it should be taken from field "Tax Destination Country" (VBAK-STCEG_L) and when that one is empty, than it should be taken from the customer (KNA1-LAND1).
- currency_key parameter: Is often in the header of a business object table. For example for Sales orders it is in field "SD document currency" (VBAK-WAERK).
- language_id parameter: Can often be retrieved from the receiver partner. For a Sales order is it the Customer field Language Key (KNA1-SPRAS). Or it can be retrieved from the address ADRC-LANGU

# Tips
- Currency symbols: see https://en.wikipedia.org/wiki/Currency_symbol
- Add currency symbols: can be added in XSLT program ZEML_NUMBER_DATETIME_FUNCTIONS.
- Euro currency symbol left or right? See https://en.wikipedia.org/wiki/Language_and_the_euro.
- ABAP XSLT manual: search Google: ABAP XSLT reference
