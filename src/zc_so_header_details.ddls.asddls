@AbapCatalog.viewEnhancementCategory: [#NONE]

// Authorization enabling based on the below annotations.
@AccessControl.authorizationCheck: #NOT_REQUIRED


// Application Description will be picked based on the below annotataion specification
@EndUserText.label: 'Consumption View for SO Header Details'

@Metadata.ignorePropagatedAnnotations: true

// Below Annotation enables the search field in the 
// Selection screen of the fiori application
@Search.searchable: true

@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
// Below Annotations enables you to create a seperate file to handle 
// all UI Based annotations directly to your CDS Source Views.
@Metadata.allowExtensions: true

// Below Annotations enables you to have bold column value as per the standard
@ObjectModel.semanticKey: ['SalesDoc_No']


define view entity ZC_SO_HEADER_DETAILS as select from ZI_SOHEADER_TOTALPRICE_CDS_PS
association[1..*] to ZC_SO_ITEM_DETAILS               as _salesitm       on $projection.SalesDoc_No      = _salesitm.ECommSalesorder
association[1..1] to ZC_SALESORDER_TYPE_PS            as _sotypedet      on $projection.SoType           = _sotypedet.SoType
association[1]    to ZC_COMPANYCODE_CDS_PS            as _companycode    on $projection.Bukrs            = _companycode.Bukrs
// All the key field should be mapped on the ON condition.
association[0..1] to ZC_SALESORG_CDS_PS               as _salesorg       on $projection.Vkorg             = _salesorg.Vkorg
                                                                 and $projection.Bukrs                   = _salesorg.CompanyCode
                                                             
association[1]    to ZC_SOSTATUS_VALUEHELP_CDS_PS     as _sostatus       on $projection.SoStatus         = _sostatus.SoStatus
//association[1]    to ZI_CUSTOMER_MASTER_CDS_PS as _soldtoparty    on $projection.SoldToPartyKunnr = _soldtoparty.Kunnr
association[1..1]    to ZC_CUSTOMER_MASTER_DETAILS_PS as _soldtoparty    on $projection.SoldToPartyKunnr = _soldtoparty.CustomerNumber

{
// By Specifying the below annotations, Merging the values of short text with sales Doc no.
// Result. Ex. Test Sales Order(10000001)
    @ObjectModel.text.element: ['ShortText']
    key ECommVbeln as SalesDoc_No,
    
    @ObjectModel.text.element: ['SO_Type_Description'] 
//    @Consumption.valuehelpdefinition.entity.name:  'ZC_SALESORDER_TYPE_PS' 
//    @Consumption.valuehelpdefinition.entity.element: 'SoType' 
   
   @Consumption.valueHelpDefinition: [{ entity:{ name: 'ZC_SALESORDER_TYPE_PS', element: 'SoType' } } ]
    SoType,
    
    //Exposing the ImageUrl field from SO Type Views
    @Semantics.imageUrl: true
    _sotypedet.Imageurl as SOTypeImageUrl,

// Enabling the fuzzy search       
    @Search.defaultSearchElement: true 
    @Search.fuzzinessThreshold: 0.70
    @Search.ranking: #HIGH
    
    @Semantics.text: true
    _sotypedet.SoTypeText as SO_Type_Description,
    
    ShortText,
    @Consumption.valueHelpDefinition:[{entity:{name: 'ZC_COMPANYCODE_CDS_PS',element: 'Bukrs'} }]
    Bukrs,
    
    @Search.defaultSearchElement: true 
    @Search.fuzzinessThreshold: 0.80
    @Search.ranking: #HIGH  
    @Consumption.valueHelpDefinition: [{ entity:{ name : 'ZC_SALESORG_CDS_PS', element: 'Vkorg' },   
                                        additionalBinding: [{ element:'CompanyCode', localElement:'Bukrs' }] }]
    Vkorg,
    
    @ObjectModel.text.element: ['StatusText']
    @Consumption.valueHelpDefinition: [{ entity:{ name : 'ZC_SOSTATUS_VALUEHELP_CDS_PS', element: 'SoStatus' } }]
    SoStatus,
    @Semantics.text: true    
    StatusText,
    
    //SO Status Criticality 
    case 
      when SoStatus = 'C' then 3 
      when SoStatus = 'B' then 1
      else 2
      end as CriticalityValue,
      
    
    
    //Enabling the f4 help for the selection field
    //Additional binding help you to restrict dependent f4 help values associated one only.
    @Consumption.valueHelpDefinition:[{entity:{name: 'ZC_CUSTOMER_MASTER_DETAILS_PS',element: 'CustomerNumber'} }]
//                                              additionalBinding:[{ element : 'CustomerName', localElement: 'Bukrs' }] }]
    @ObjectModel.text.element: ['name1']    
    SoldToPartyKunnr,
    
// Enabling the fuzzy search with ranking as Medium   
    @Search.defaultSearchElement: true 
    @Search.fuzzinessThreshold: 0.90
    @Search.ranking: #MEDIUM
    
//    @Semantics.text: true    
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
    CoreVbeln as CoreSO,
    CreatedBy,
    CreatedDate,
    CreatedTime,
    ChangedData,
    ChangedTime,
    
    /* Associations */
    _companycode,
    _currencydet,
    _salesitm,
    _salesorg,
    _soldtoparty,
    _sostatus,
    _sotypedet
}
