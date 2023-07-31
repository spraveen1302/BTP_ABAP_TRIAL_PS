@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View for Total Price calculation on header level'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

//@VDM.viewType: #COMPOSITE
define view entity ZI_SOHEADER_TOTALPRICE_CDS_PS as select from ZI_SALESORDER_HEADER_CDS_PS
{
    key ECommVbeln,
    SoType,
    ShortText,
    Bukrs,
    Vkorg,
    SoStatus,
    _sostatus.StatusText,
    SoldToPartyKunnr,
    _soldtoparty._addressdetails.name1,
    @Semantics.amount.currencyCode: 'Currency'   
    sum( _salesitm.BasePrice )     as Total_BasePrice,
    
    @Semantics.amount.currencyCode: 'Currency'
    sum( _salesitm.SgstTaxAmount ) as Total_Sgsttxamt,
    
    @Semantics.amount.currencyCode: 'Currency'
    sum( _salesitm.IgstTaxAmount ) as Total_Igsttxamt,
    
    @Semantics.amount.currencyCode: 'Currency'
    sum( _salesitm.CgstTaxAmount ) as Total_Cgsttxamt,
    
    @Semantics.amount.currencyCode: 'Currency'
    sum( _salesitm.BasePrice     + 
         _salesitm.SgstTaxAmount +
         _salesitm.CgstTaxAmount + 
         _salesitm.IgstTaxAmount ) as GrossAmount,
    
    _salesitm.Currency,
    CoreVbeln,
    CreatedBy,
    CreatedDate,
    CreatedTime,
    ChangedData,
    ChangedTime,
            
    /* Associations */
    _companycode,
    _salesitm,
    _salesorg,
    _soldtoparty,
    _sostatus,
    _sotypedet,
    _salesitm._currencydet

    
    
}

group by
     ECommVbeln,
     SoType, 
     ShortText,
     Bukrs,
     Vkorg,
     SoStatus,
     _sostatus.StatusText,
     SoldToPartyKunnr,
     _soldtoparty._addressdetails.name1,
     _salesitm.Currency,
     CoreVbeln,
     CreatedBy,
     CreatedDate,
     CreatedTime,
     ChangedData,
     ChangedTime
