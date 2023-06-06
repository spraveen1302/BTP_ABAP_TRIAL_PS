@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View for SO Item Price Details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

//@VDM.viewType: #COMPOSITE
define view entity ZI_SOITEMPRICEDETAILS_CDS_PS as select from ZI_SALESORDER_ITEM_CDS_PS
{
    key ECommVbeln,
    
//    @Semantics.quantity.unitOfMeasure: 'Meins'
//    sum( Fkimg ) as TotalFkimg,
//    
//    meins,
    
    @Semantics.amount.currencyCode: 'Currency'
    sum( BasePrice ) as TotalBasePrice,
    
    @Semantics.amount.currencyCode: 'Currency' 
    sum( SgstTaxAmount ) as TotalSgstTaxAmount,
    
    @Semantics.amount.currencyCode: 'Currency' 
    sum( CgstTaxAmount ) as TotalCgstTaxAmount,
    
    @Semantics.amount.currencyCode: 'Currency' 
    sum( IgstTaxAmount ) as TotalIgstTaxAmount,
   
    @Semantics.amount.currencyCode: 'Currency' 
    sum( SgstTaxAmount ) + 
    sum( CgstTaxAmount ) + 
    sum( IgstTaxAmount ) as TotalTax,
    
    @Semantics.amount.currencyCode: 'Currency' 
    sum( BasePrice ) + 
    sum( SgstTaxAmount ) + 
    sum( CgstTaxAmount ) + 
    sum( IgstTaxAmount ) as GrossAmount,
    
    Currency,
    
//    CoreVbeln,
//    CorePosnr,
//    ChangedData,
//    ChangedTime,
    /* Associations */
    
    _currencydet
 
}
group by
    ECommVbeln,
//    meins,
    Currency,
    _currencydet.WaersText

