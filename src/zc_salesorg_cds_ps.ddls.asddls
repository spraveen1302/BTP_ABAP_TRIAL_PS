@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Sales Org Details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity ZC_SALESORG_CDS_PS as select from ZI_SALESORG_CDS_PS
{

    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.9
    key Vkorg, 
    key Bukrs as CompanyCode,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    @Search.ranking: #MEDIUM
    Waers     as Currency,
    _companycode.butxt as CCodeTxt,
    _currencydet.waers_text as CurrencyText,
    _currencydet.image_url as CurrencyImage,
    SorgTxt,
    _addressdetails.name1 as SalesOrgName,
    Addrnumber,
    
    
    /* Associations */
    _addressdetails,
    _companycode,
    _currencydet
    
}
