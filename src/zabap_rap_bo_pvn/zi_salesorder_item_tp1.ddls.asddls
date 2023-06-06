@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SO Item child of ZI_SALESORDER_HEADER_TP'
define view entity ZI_SALESORDER_ITEM_TP1 as select from ZI_SALESORDER_ITEM_CDS_PS
association to parent ZI_SALESORDER_HEADER_TP1 as _SOHeader
    on $projection.ECommVbeln = _SOHeader.ECommVbeln
{    
    key  ECommVbeln,
    key  ECommPosnr,
    SoldToPartyKunnr,
    Matnr,
    ShipToPartyKunnr,
    BillToPartyKunnr,
    PayerKunnr,
    Fkimg,
    Meins,
    BasePrice,
    SgstTaxAmount,
    CgstTaxAmount,
    IgstTaxAmount,
    Currency,
    CoreVbeln,
    CorePosnr,
    @Semantics.user.localInstanceLastChangedBy: true
    ChangedData,
//    @semantics.timeZone: true
    ChangedTime,
    
    /* Associations */
    _currencydet,
    _custmaster_billto,
    _custmaster_payer,
    _custmaster_shipto,
    _custmaster_soldto,
    _matmaster,
//    _saleshdr,
    _SOHeader // Make association public
}
