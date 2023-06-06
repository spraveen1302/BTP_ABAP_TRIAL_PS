@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order BO'
define root view entity ZI_SALESORDER_HEADER_TP1 as select from ZI_SOHEADER_TOTALPRICE_CDS_PS
composition[*] of ZI_SALESORDER_ITEM_TP1 as _SOItems
association[1..1] to ZI_SOTYPE_CDS_PS          as _sotypedet      on $projection.SoType           = _sotypedet.SoType
association[1]    to ZI_COMPANYCODE_CDS_PS     as _companycode    on $projection.Bukrs            = _companycode.Bukrs
// All the key field should be mapped on the ON condition.
association[0..1] to ZI_SALESORG_CDS_PS        as _salesorg       on $projection.Vkorg            = _salesorg.Vkorg 
                                                                 and $projection.Bukrs            = _salesorg.Bukrs
association[1]    to ZI_SOSTATUS_CDS_PS        as _sostatus       on $projection.SoStatus         = _sostatus.SoStatus
association[1]    to ZI_CUSTOMER_MASTER_CDS_PS as _soldtoparty    on $projection.SoldToPartyKunnr = _soldtoparty.Kunnr
{
    key ECommVbeln,
    SoType,
    ShortText,
    Bukrs,
    Vkorg,
    SoStatus,
    StatusText,
    SoldToPartyKunnr,
    name1,
    Total_BasePrice,
    Total_Sgsttxamt,
    Total_Igsttxamt,
    Total_Cgsttxamt,
    GrossAmount,
    Currency,
    CoreVbeln,
    CreatedBy,
    CreatedDate,
    CreatedTime,
    ChangedData,
    ChangedTime,
    
    /* Associations */
    
    _companycode,
    _currencydet,
    _salesorg,
    _soldtoparty,
    _sostatus,
    _salesitm,
    _sotypedet,
 
    /* Compositions for this BO Root View*/
    _SOItems
}
