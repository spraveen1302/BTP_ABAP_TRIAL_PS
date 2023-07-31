@EndUserText.label: 'Projection of BO Root'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['ECommVbeln']
@Search.searchable: true
define root view entity ZC_SALESORDER_HEADER_TP 
provider contract transactional_query
as projection on ZI_SALESORDER_HEADER_TP1
association[1..1] to ZC_SALESORDER_TYPE_PS            as _sotypedet      on $projection.SoType           = _sotypedet.SoType
association[1]    to ZC_COMPANYCODE_CDS_PS            as _companycode    on $projection.Bukrs            = _companycode.Bukrs
// All the key field should be mapped on the ON condition.
association[0..1] to ZC_SALESORG_CDS_PS               as _salesorg1       on $projection.Vkorg             = _salesorg1.Vkorg
                                                      and $projection.Bukrs  = _salesorg1.CompanyCode
                                                             
association[1]    to ZC_SOSTATUS_VALUEHELP_CDS_PS     as _sostatus       on $projection.SoStatus         = _sostatus.SoStatus
association[1..1]    to ZC_CUSTOMER_MASTER_DETAILS_PS as _soldtoparty    on $projection.SoldToPartyKunnr = _soldtoparty.CustomerNumber
{
    @ObjectModel.text.element: ['ShortText']
    key ECommVbeln,
    SoType,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    @Search.ranking: #HIGH
    ShortText,
    Bukrs,
    Vkorg,
    SoStatus,
    StatusText,
    SoldToPartyKunnr,
    name1,
    @Semantics.amount.currencyCode: 'Currency'
    Total_BasePrice,
    @Semantics.amount.currencyCode: 'Currency'
    Total_Sgsttxamt,
    @Semantics.amount.currencyCode: 'Currency'
    Total_Igsttxamt,
    @Semantics.amount.currencyCode: 'Currency'
    Total_Cgsttxamt,
    @Semantics.amount.currencyCode: 'Currency'
    GrossAmount,
    Currency,
    _salesorg.SorgTxt as SalesOrgTxt,
    CoreVbeln,
    CreatedBy,
    CreatedDate,
    CreatedTime,
    ChangedData,
    ChangedTime,

    
    /* Associations */
    _SOItems : redirected to composition child ZC_SALESORDER_ITEM_TP,
    _companycode,
    _currencydet,
    _salesorg,
    _soldtoparty,
    _sostatus,
    _salesitm,
    _sotypedet,
    _salesorg1
    
    
}
