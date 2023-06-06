@EndUserText.label: 'Projection of BO Items'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZC_SALESORDER_ITEM_TP 
as projection on ZI_SALESORDER_ITEM_TP1
{
    key ECommVbeln,
    key ECommPosnr,
    SoldToPartyKunnr,
    Matnr,
    ShipToPartyKunnr,
    BillToPartyKunnr,
    PayerKunnr,
    Fkimg,
    Meins,
    @Semantics.amount.currencyCode: 'Currency'
    BasePrice,
    @Semantics.amount.currencyCode: 'Currency'
    SgstTaxAmount,
    @Semantics.amount.currencyCode: 'Currency'
    CgstTaxAmount,
    @Semantics.amount.currencyCode: 'Currency'
    IgstTaxAmount, 
    Currency,
    CoreVbeln,
    CorePosnr,
    ChangedData,
    ChangedTime,
    
    /* Associations */
    _SOHeader : redirected to parent ZC_SALESORDER_HEADER_TP,
    _currencydet,
    _custmaster_billto,
    _custmaster_payer,
    _custmaster_shipto,
    _custmaster_soldto,
    _matmaster
    
}
