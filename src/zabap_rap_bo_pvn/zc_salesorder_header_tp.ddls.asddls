@EndUserText.label: 'Projection of BO Root'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['ECommVbeln']
@Search.searchable: true
define root view entity ZC_SALESORDER_HEADER_TP 
provider contract transactional_query
as projection on ZI_SALESORDER_HEADER_TP1
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
    _sotypedet
    
}
