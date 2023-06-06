@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Material Master Details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_MATERIAL_MASTER1_CDS_PS as select from ZI_MATERIAL_MASTER1_CDS_PS
{
    key Matnr,
    Maktx,
    Mtart,
    MaterialCategory,
    Imageurl
}
