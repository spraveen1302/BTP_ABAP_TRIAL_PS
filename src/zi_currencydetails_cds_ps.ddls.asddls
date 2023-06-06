@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View for Currency Details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CURRENCYDETAILS_CDS_PS as select from zzt_curc_ps
{
    key waers as Waers,
    key country as Country,
    waers_text as WaersText,
    image_url as ImageUrl
}
