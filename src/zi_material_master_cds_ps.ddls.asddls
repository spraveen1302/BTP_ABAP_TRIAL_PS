@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View for Material Master Details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_MATERIAL_MASTER_CDS_PS as select from zzt_mara_ps
{
    key matnr as Matnr,
    maktx as Maktx,
    mtart as Mtart,
    material_category as MaterialCategory,
    imageurl as Imageurl
}
