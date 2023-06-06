@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Currency Details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_CURRENCYDETAILS_CDS_PS as select from ZI_CURRENCYDETAILS_CDS_PS
{
    key Waers,
    key Country,
    WaersText,
    ImageUrl
}
