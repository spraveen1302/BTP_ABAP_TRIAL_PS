@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View for Sales Org'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_SALESORG_CDS_PS as select from zzt_tvko
association[1]    to zzt_t001_ps as _companycode on $projection.Bukrs = _companycode.bukrs
association[1]    to zzt_curc_ps as _currencydet on $projection.Waers = _currencydet.waers                                                                                                   
association[1]    to zzt_adrc_ps as _addressdetails on $projection.Addrnumber = _addressdetails.addrnumber
{
    key vkorg as Vkorg,
    key bukrs as Bukrs,
    waers as Waers,
    sorg_txt as SorgTxt,
    addrnumber as Addrnumber,
    _companycode,
    _currencydet,
    _addressdetails
    
}
