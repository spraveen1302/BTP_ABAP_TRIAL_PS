@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic View for Sales Order Status'
//@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity ZI_SOSTATUS_CDS_PS as select from zzt_so_status
{
@ObjectModel.text.element: ['StatusText']
    key so_status as SoStatus,
@Semantics.text: true
    status_text as StatusText
}
