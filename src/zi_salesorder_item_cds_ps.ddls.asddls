@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View Sales Order Item table'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

//@VDM.viewType: #BASIC
define view entity ZI_SALESORDER_ITEM_CDS_PS as select from zzt_vbap_ps

association[1..1] to ZI_SALESORDER_HEADER_CDS_PS as _saleshdr on $projection.ECommVbeln                = _saleshdr.ECommVbeln
//We can have SalesDocuments created without Materials also
association[0..1] to ZI_MATERIAL_MASTER1_CDS_PS as _matmaster on $projection.Matnr                     = _matmaster.Matnr
association[1..1] to ZI_CUSTOMER_MASTER_CDS_PS   as _custmaster_soldto on $projection.SoldToPartyKunnr = _custmaster_soldto.Kunnr
association[1..1] to ZI_CUSTOMER_MASTER_CDS_PS   as _custmaster_shipto on $projection.ShipToPartyKunnr = _custmaster_shipto.Kunnr
association[1..1] to ZI_CUSTOMER_MASTER_CDS_PS   as _custmaster_billto on $projection.BillToPartyKunnr = _custmaster_billto.Kunnr
association[1..1] to ZI_CUSTOMER_MASTER_CDS_PS   as _custmaster_payer  on $projection.BillToPartyKunnr = _custmaster_payer.Kunnr

// Warning on 18th line - because of country is not avilable to map on the assocation condition 
association[1..1] to ZI_CURRENCYDETAILS_CDS_PS   as _currencydet       on $projection.Currency         = _currencydet.Waers

{
    key e_comm_vbeln     as ECommVbeln,
    key e_comm_posnr     as ECommPosnr,
    sold_to_party_kunnr  as SoldToPartyKunnr,
    matnr                as Matnr,
    
    ship_to_party_kunnr  as ShipToPartyKunnr,
    bill_to_party_kunnr  as BillToPartyKunnr,
    payer_kunnr          as PayerKunnr,
    
    @Semantics.quantity.unitOfMeasure: 'Meins'
    fkimg                as Fkimg,
    meins                as Meins,
    @Semantics.amount.currencyCode: 'Currency'    
    base_price           as BasePrice,
    
    @Semantics.amount.currencyCode: 'Currency'    
    sgst_tax_amount      as SgstTaxAmount,
    
    @Semantics.amount.currencyCode: 'Currency'   
    cgst_tax_amount      as CgstTaxAmount,
    
    @Semantics.amount.currencyCode: 'Currency'   
    igst_tax_amount      as IgstTaxAmount,
    
    currency             as Currency,
    core_vbeln           as CoreVbeln,
    core_posnr           as CorePosnr,
    changed_data         as ChangedData,
    changed_time         as ChangedTime,
    
    
    //Association
    _saleshdr,
    _matmaster,
    _custmaster_soldto,
    _custmaster_shipto,
    _custmaster_billto,
    _custmaster_payer,
    _currencydet
}

