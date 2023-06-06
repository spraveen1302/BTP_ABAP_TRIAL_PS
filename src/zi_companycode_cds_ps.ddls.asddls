@AbapCatalog.sqlViewName: 'ZSQLV_T001_PS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View for Company Code'

//@VDM.viewtype: #BASIC
define view ZI_COMPANYCODE_CDS_PS as select from zzt_t001_ps
 association[1] to zzt_adrc_ps as _addressdetails
 on $projection.Addrnumber = _addressdetails.addrnumber
 
//Projection of the fields as below:-
{
    key bukrs as Bukrs,
    butxt as Butxt,
    country as Country,
    ort01 as Ort01,
    waers as Waers,
    category as Category,
    addrnumber as Addrnumber,
    _addressdetails
}
