@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'F4 Help for the SO Status'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_SOSTATUS_VALUEHELP_CDS_PS as select from ZI_SOSTATUS_CDS_PS
{
    @ObjectModel.text.element: ['StatusText']
    key SoStatus,
    @Semantics.text: true
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.70
    @Search.ranking: #HIGH
    StatusText
}
