@EndUserText.label: 'Projection of BO Items'
@AccessControl.authorizationCheck: #NOT_REQUIRED

//You need to use the below annotation to link a 'Metadata Extension' file with a CDS View Entity
@Metadata.allowExtensions: true

define view entity ZC_SALESORDER_ITEM_TP 
as projection on ZI_SALESORDER_ITEM_TP1


//We can have SalesDocuments created without Materials also
association[0..1] to ZC_MATERIAL_MASTER1_CDS_PS      as _matmaster1         on $projection.Matnr            = _matmaster1.Matnr
association[1..1] to ZC_CUSTOMER_MASTER_DETAILS_PS   as _custmaster_soldto on $projection.SoldToPartyKunnr = _custmaster_soldto.CustomerNumber
association[1..1] to ZC_CUSTOMER_MASTER_DETAILS_PS   as _custmaster_shipto on $projection.ShipToPartyKunnr = _custmaster_shipto.CustomerNumber
association[1..1] to ZC_CUSTOMER_MASTER_DETAILS_PS   as _custmaster_billto on $projection.BillToPartyKunnr = _custmaster_billto.CustomerNumber
association[1..1] to ZC_CUSTOMER_MASTER_DETAILS_PS   as _custmaster_payer  on $projection.BillToPartyKunnr = _custmaster_payer.CustomerNumber

// Warning on 24th line - because of country is not avilable to map on the assocation condition 
association[1..1] to ZC_CURRENCYDETAILS_CDS_PS   as _currencydet       on $projection.Currency         = _currencydet.Waers

{
    key ECommVbeln,
    key ECommPosnr,
    
    Matnr,
    Imageurl,
    SoldToPartyKunnr,
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
    _saleshdr,
    _matmaster1,
    _matmaster
    
    
}
