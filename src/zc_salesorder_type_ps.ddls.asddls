@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'C View - F4 Help for SO Type'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_SALESORDER_TYPE_PS as select from ZI_SOTYPE_CDS_PS
{
    @ObjectModel.text.element: ['SoTypeText']
    key SoType,
    
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.80
    @Search.ranking: #HIGH

// Below Annotations - End User Text Overwrites ( UI.lineitem.text )description info which is specified in metadata file 

    @EndUserText.label: 'SO Type Description'
    @EndUserText.quickInfo: 'Detailed SO Type Info'
    @Semantics.text: true
    SoTypeText,
    Imageurl
}
