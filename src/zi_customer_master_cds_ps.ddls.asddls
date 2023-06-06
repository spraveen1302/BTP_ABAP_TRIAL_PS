@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View for Customer Master Details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//@VDM.viewtype: #BASIC
define view entity ZI_CUSTOMER_MASTER_CDS_PS as select from zzt_kna1_ps
 association[1] to zzt_t005_ps as _countrydetails on $projection.Country = _countrydetails.country
 association[1] to zzt_adrc_ps as _addressdetails on $projection.Addrnumber = _addressdetails.addrnumber 
{
    key kunnr as Kunnr,
    country as Country,
    addrnumber as Addrnumber,
//// Exposing the country and address details of customer details via association    
//    _countrydetails.country_text,
//    _countrydetails.country_image,
//    
//    _addressdetails.region,
//    _addressdetails.email_address,
//    _addressdetails.tel_number,
//    _addressdetails.www_address,
    
    
    //Associations
    _countrydetails,
    _addressdetails
    

    

}
