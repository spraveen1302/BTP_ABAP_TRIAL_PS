@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Sales Order Item Details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//You need to use the below annotation to link a 'Metadata Extension' file with a CDS View Entity
@Metadata.allowExtensions: true
//@VDM.viewType: #CONSUMPTION

// Below Annotation enables the search field in the 
// Selection screen of the fiori application
@Search.searchable: true

define view entity ZC_SO_ITEM_DETAILS as select from ZI_SALESORDER_ITEM_CDS_PS
association[1..1] to ZC_SO_HEADER_DETAILS as _saleshdr on $projection.ECommSalesorder = _saleshdr.SalesDoc_No
//We can have SalesDocuments created without Materials also
association[0..1] to ZC_MATERIAL_MASTER1_CDS_PS      as _matmaster         on $projection.Matnr            = _matmaster.Matnr
association[1..1] to ZC_CUSTOMER_MASTER_DETAILS_PS   as _custmaster_soldto on $projection.SoldToPartyKunnr = _custmaster_soldto.CustomerNumber
association[1..1] to ZC_CUSTOMER_MASTER_DETAILS_PS   as _custmaster_shipto on $projection.ShipToPartyKunnr = _custmaster_shipto.CustomerNumber
association[1..1] to ZC_CUSTOMER_MASTER_DETAILS_PS   as _custmaster_billto on $projection.BillToPartyKunnr = _custmaster_billto.CustomerNumber
association[1..1] to ZC_CUSTOMER_MASTER_DETAILS_PS   as _custmaster_payer  on $projection.BillToPartyKunnr = _custmaster_payer.CustomerNumber

// Warning on 24th line - because of country is not avilable to map on the assocation condition 
association[1..1] to ZC_CURRENCYDETAILS_CDS_PS   as _currencydet       on $projection.Currency         = _currencydet.Waers
                                                                      
{
    key ECommVbeln as ECommSalesorder,
    key ECommPosnr as ECommSalesItemNo,
    
    @ObjectModel.text.element: ['Description']
    Matnr,
    
    @Semantics.imageUrl: true
    _matmaster.Imageurl as Material_ImageUrl,
    
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    _matmaster.Maktx as Description,
   
    
    @ObjectModel.text.element: ['SoldToPartyName']
    SoldToPartyKunnr,
    _custmaster_soldto.CustomerName as SoldToPartyName,
    
    @ObjectModel.text.element: ['ShipToPartyName']
    ShipToPartyKunnr,
    _custmaster_shipto.CustomerName as ShipToPartyName,
    
    @ObjectModel.text.element: ['BillToPartyName']
    BillToPartyKunnr,
    _custmaster_billto.CustomerName as BillToPartyName,
    
    @ObjectModel.text.element: ['PayerName']
    PayerKunnr,
    _custmaster_payer.CustomerName as PayerName,
 
    
    @Semantics.quantity.unitOfMeasure: 'Meins'
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
    _currencydet,
    _custmaster_billto,
    _custmaster_payer,
    _custmaster_shipto,
    _custmaster_soldto,
    _saleshdr,
    _matmaster
}
